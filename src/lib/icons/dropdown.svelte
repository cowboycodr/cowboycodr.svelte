<script>
  export let links;

  import { onMount } from "svelte";

  let expanded = false;

  let dropdownWidth;

  let dropdown = {
    x: 0,
    y: 0,
    visible: true,
  }

  onMount(() => {
    // Giving handleArrowClick access to dropdown width
    dropdown.visible = false;
  })

  function handleArrowClick(e) {
    e.preventDefault();

    expanded = !expanded;

    dropdown = {
      x: e.clientX - (dropdownWidth / 2) - 10 + 'px',
      y: e.clientY + 25 + 'px',
      visible: expanded
    }

    console.log(dropdown);
  }
</script>

<span
  class="arrow {$$props.class}"
>
  <svg
    on:click={handleArrowClick} 
    class:arrow__expanded={expanded}
    class:arrow__compact={!expanded}
    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
  >
    <path d="M8.122 24l-4.122-4 8-8-8-8 4.122-4 11.878 12z"/>
  </svg>
</span>

<div 
  bind:clientWidth={dropdownWidth}
  class="dropdown"
  class:invisible={!dropdown.visible}
  style="position:absolute;left:{dropdown.x};top:{dropdown.y};"
>
  {#each links as link}
    <div class="section">
      <a href={link.href} class="link">{link.content}</a>
    </div>
  {/each}
</div>

<style>
  .arrow:hover {
    cursor: pointer;
    fill: var(--primary);
  }

  .arrow__compact {
    transform: rotate(0deg);

    transition: transform 0.25s;
  }

  .arrow__expanded {
    transform: rotate(90deg);

    transition: transform 0.25s;
  }

  .dropdown {
    z-index: 99999;
    position: absolute;

    background-color: var(--primary); 
    color: white;
    padding: 3px;
    border-radius: 5px;

    font-size: 1.25em;
  }

  .invisible {
    display: none;
  }

  .section {
    border-radius: 3px;
    padding: 2px;
    color: black;
  }

  .section:hover {
    background-color: white;
  }

  .section:hover .link {
    background-image: linear-gradient(var(--primary), var(--primary));
    background-size: 100% 5%;
    color: var(--primary);
  }

  .link {
    font-weight: 600;

    font-family: monospace;
    color: white;
    text-decoration: none;

    background-image: linear-gradient(white, white);
    background-size: 0.6em 5%;
    background-repeat: no-repeat;
    background-position: left bottom;

    transition: background-size 200ms ease;
  }

</style>