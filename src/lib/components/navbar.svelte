<script context="module">
  export const ssr = false;
</script>

<script>
  import { page } from "$app/stores";

  import Link from '$lib/components/link.svelte';
  import Github from "$lib/icons/media/github.svelte";
  import Dropdown from "$lib/icons/dropdown.svelte";

  let paths = $page.path.split("/");
  let active = paths[paths.length - 1];

  let scrolled = false;
  let desktop = true;
  let width = false;

  function handlePlatform() {
    width = window.innerWidth;

    if (width > 600) {
      desktop = true;
    } else {
      desktop = false;
    }
  }

  handlePlatform();

  window.addEventListener('resize', handlePlatform)

  document.addEventListener("scroll", (e) => {
    if (document.documentElement.scrollTop > 0) {
      scrolled = true;
    } else {
      scrolled = false;
    }
  });

  let standardLinks = [
    {
      href: "/repos",
      content: "Repos",
    },
    {
      href: '/projects',
      content: "Projects"
    },
    {
      href: "/countdown",
      content: "Countdown",
    },
  ];
</script>

<svelte:head>
  {#if active}
    <title>cowboycodr | {active}</title>
  {:else}
    <title>cowboycodr</title>
  {/if}
</svelte:head>

<div
  class="navbar"
  class:navbar__scrolled={scrolled}
>
  <div class="home">
    <span class="home__link">
      <Link href="/">cowboycodr.github.io</Link>
    </span>
  </div>
  <div class="navigation__links">
    {#if desktop == true}
      {#each standardLinks as link}
        <span class="standard__link">
          <Link href={link.href}>{link.content}</Link>
        </span>
      {/each}
    {:else}
      <Dropdown links={standardLinks} />
    {/if}
  <Github />
  </div>
</div>

<style>
  :root {
    --mobile-screen-width: 512px;
  }

  .navbar {
    display: flex;
    justify-content: space-around;

    background-color: white;

    align-items: center;

    padding: 20px;
    border-bottom: 1px solid rgb(153, 152, 152);
    z-index: 9999;
  }

  .navbar__scrolled {
    position: sticky;
    top: 0;
    width: auto;

    border: none;
    box-shadow: 0px 0px 10px rgb(100, 100, 100);

    transition: box-shadow 0.25s;
  }

  .home__link {
    font-size: 2em;
  }

  .navigation__links {
    display: flex;
    align-items: center;

    font-size: 18px;
  }

  .navigation__links :global(.standard__link) {
    margin-right: 10px;
  }

  .navigation__links * {
    margin-right: 30px;
  }

  .standard__link {
    font-size: 1em;
  }

  @media (max-width: 600px) {
    .navbar {
      padding: 5px;
      width: auto;
    }

    .home__link {
      font-size: 1.5em;
    }

    .navigation__links * {
      margin-right: 10px;
    }
  }
</style>
