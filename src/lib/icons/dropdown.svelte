<script>
  export let links;

  import { onMount } from "svelte";

  let expanded = false;

  let dropdownElement;
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

  function handleClick(e) {
    if (dropdownElement.parentNode.contains(e.target)) {
      expanded = !expanded;

      dropdown = {
        x: e.clientX - (dropdownWidth / 2) - 10 + 'px',
        y: e.clientY + 25 + 'px',
        visible: expanded
      }
    } else {
      expanded = false;

      dropdown = {
        x: 0,
        y: 0,
        visible: expanded
      }
    }
  }
</script>

<svelte:window on:click={handleClick}></svelte:window>

<span
  bind:this={dropdownElement}
  id="dropdown"
  class="arrow {$$props.class}"
>
  <svg
    class:arrow__expanded={expanded}
    class:arrow__compact={!expanded}
    xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
  >
    <path d="M24 6h-24v-4h24v4zm0 4h-24v4h24v-4zm0 8h-24v4h24v-4z"/>
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
  #dropdown:hover {
    cursor: pointer;
  }

  .arrow__expanded {
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
    border: 2px solid var(--secondary);
  }

  .invisible {
    display: none;
  }

  .section {
    border-radius: 3px;
    padding: 2px;
    color: black;
  }

  .section:hover .link {
    background-size: 100% 5%;
  }

  .link {
    display: inline-block;
    width: 100%;

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