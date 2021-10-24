<script context="module">
  export const ssr = false;
</script>

<script>
  import Modal from '$lib/components/modal.svelte';

  import Navbar from '$lib/components/navbar.svelte';

  let fileNameInput;

  let creating = false;

  let pyodide;

  let pyodideLoaded = false;
  async function initiatePyodide() {
    pyodide = await loadPyodide({ indexURL : "https://cdn.jsdelivr.net/pyodide/v0.18.1/full/" });

    pyodideLoaded = true;
  }

  let files = [
    {
      title: 'Welcome',
      content: '"Hello, World!"',
      async output() {
        if (pyodideLoaded == false) {
          await initiatePyodide();
        }

        let content = await pyodide.runPython(this.content);
        return content;
      },
    }
  ]

  async function fileOutput(file) {
    if (pyodideLoaded == false) {
      await initiatePyodide();
    }

    let content = await pyodide.runPython(file.content);
    return content;
  }

  let active = files[0];
  let output;

  function createFile() {
    files.push({
      title: fileNameInput.value,
      content: ''
    });

    files = [...files];
    creating = false;
  }
</script>

<svelte:head>
  <script src="https://cdn.jsdelivr.net/pyodide/v0.18.1/full/pyodide.js"></script>
</svelte:head>

{#if creating}
  <Modal onClose={() => createFile()}>
    <input bind:this={fileNameInput} class="filename-input" type="text">
  </Modal>
{/if}

<Navbar />

<div class="content">
  <div class="enviroment">
    <div class="file-manager">
      <div class="create-button" on:click={() => creating = true}>+</div>
      {#each files as file}
        <div class="file" on:click={() => active = file}>
          {file.title}
        </div>
      {/each}
    </div>
    <div class="file-area">
      <div class="title">
        {active.title}
      </div>
      <div 
        class="run"
        on:click={async () => {output.innerHTML = await fileOutput(active)}}
      >
        Run
      </div>
      <div class="file-content">
        <textarea
          class="file-content-input"
          wrap="hard"
          bind:value={active.content}
        />
      </div>
      <div class="output" bind:this={output}>

      </div>
    </div>
  </div>
</div>

<style>
  :root {
    font-family: "Rubik";
  }

  .content {
    height: 80vh;

    padding: 30px;
  }

  .enviroment {
    display: flex;
    flex-direction: row;

    border: 1px solid #c4c4c4;
    border-radius: 20px;

    height: 100%;
    width: 100%;
  }

  .file-manager {
    border-radius: 20px 0px 0px 20px;
    min-width: 200px;
    width: 10%;
    border-right: 1px solid var(--secondary);
  }

  .create-button {
    width: 100%;
    height: 60px;
    background-color: var(--primary);
    border-radius: 20px 0px 0px 0px;
    font-size: 3em;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
  }

  .create-button:hover {
    cursor: pointer;
  }

  .file-area {
    height: 100%;
    width: 100%;
  }

  .title {
    width: 100%;
    text-align: center;

    margin-top: 5px;
    border-bottom: 1px solid var(--secondary);
  }

  .run {
    text-align: center;
    background-color: var(--primary);
    margin: 0;
    color: white;
    border-bottom: 1px solid var(--secondary);
  }

  .run:hover {
    cursor: pointer;
  }

  .file-content-input {
    font-size: 16px;
    width: 99%;
    min-height: 300px;
    resize: none;
    border: none;
    outline: none;
    border-bottom: 1px solid var(--secondary);
  }

  .filename-input {
    border: 0;
    outline: 0;
    height: 30px;
    width: 50%;
    min-width: 300px;
  }

  .file {
    height: 40px;
    margin: 5px;
    padding: 5px;
    border-bottom: 1px solid var(--secondary);
  }

  .file:hover {
    cursor: pointer;
    border-radius: 5px;
    background-color: var(--secondary);
  }
</style>