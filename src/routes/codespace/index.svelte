<script context="module">
  export const ssr = false;
</script>

<script>
  import Site from "$lib/layouts/site.svelte";
  import Modal from "$lib/components/modal.svelte";

  let addFileModal = false;

  let files = [];

  $: console.log(files);
</script>

{#if addFileModal}
  <Modal>
    <div class="modal-content">
      <input type="file">
    </div>
  </Modal>
{/if}

<Site>
  <div class="content page">
    <div class="enviroment">
      <div class="file-manager">
        <div
          on:click={() => {addFileModal = true}}
          class="add-file"
        >
          +
        </div>
      </div>
      <div class="file-content-manager">
        <div class="title"></div>
        <div class="options"></div>
        <div class="file-content"></div>
      </div>
    </div>
  </div>
</Site>

<style>
  .modal-content {
    min-width: 400px;
    min-height: 150px;
    border-radius: 20px;
    padding: 10px;

    background-color: white;
    z-index: 9999;

    display: flex;
    justify-content: center;
    align-items: center;
  }

  .content {
    padding: 30px;
  }

  .enviroment {
    min-height: 600px;

    border: 1px solid #c4c4c4;
    border-radius: 20px;
  }

  .file-manager {
    min-height: 600px;
    height: 100%;
    width: 250px;

    color: white;
    font-size: 3em;

    border-right: 1px solid #c4c4c4;
  }

  .add-file {
    display: flex;
    justify-content: center;
    align-items: center;

    height: 60px;
    background-color: var(--primary);
    border-radius: 20px 0px 0px 0px;
  }

  .add-file:hover {
    cursor: pointer;
  }
</style>