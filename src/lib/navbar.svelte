<script context="module">
    export const ssr = false;
</script>

<script>
    import { page } from "$app/stores";

    let paths = $page.path.split('/');
    let active = paths[paths.length - 1]

    let scrolled = false; 

    document.addEventListener('scroll', (e) => {
        if (document.documentElement.scrollTop > 0) {
            scrolled = true;
        } else {
            scrolled = false;
        }
    });

    let standardLinks = [
        {
            href: '/countdown', content: 'Countdown'
        }
    ]

    let logoLinks = [
        {
            href: 'https://github.com/cowboycodr', src: '/images/github.png', alt: 'Github Logo'
        }
    ]
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
        <a href="/" class="home__link link">cowboycodr.github.io</a>
    </div>
    <div class="navigation__links">
        {#each standardLinks as link}
            <a href={link.href} class="standard__link link">{link.content}</a>
        {/each}
        {#each logoLinks as link}
            <a href={link.href} target="_blank">
                <img src={link.src} alt={link.alt} class="logo">
            </a>
        {/each}
    </div>
</div>

<style>
    :root {
        --mobile-screen-width: 512px;
    }

    .navbar {
        display: flex;
        justify-content: space-between;

        background-color: white;

        align-items: center;

        position: sticky;
        top: 0;

        padding: 20px;
        border-bottom: 1px solid rgb(153, 152, 152);
        z-index: 9999;
    }

    .navbar__scrolled {
        border: none;
        box-shadow: 0px 0px 10px rgb(100, 100, 100);
    }

    .home__link {
        font-size: 2em;
    }

    .navigation__links {
        display: flex;
        align-items: center;

        font-size: 18px;
    }

    .logo {
        width: 30px;
    }

    .standard__link {
        font-size: 1em;
    }
</style>