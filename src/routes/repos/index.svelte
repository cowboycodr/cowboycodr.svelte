<script context="module">
    export const ssr = false;
</script>

<script>
    import { onMount } from "svelte";

    import Site from "$lib/layouts/site.svelte";

    let repos;

    onMount(async () => {
        await fetch(`https://api.github.com/users/cowboycodr/repos`)
            .then(resp => resp.json())
            .then(data => {
                repos = data;
            })
    })
</script>

<Site>
    <div class="content page">
        {#if repos}
            {#each repos as repo}
                <span class="repo">
                    <a href={repo.html_url}>
                        <div class="header">
                            <h1>{repo.name.toString().toUpperCase()}</h1>
                        </div>
                        <div class="description">
                            <h2>{repo.description}</h2>
                        </div>
                    </a>
                </span>
            {/each}
        {/if}
    </div>
</Site>

<style>
    .content {
        /* max-width: 700px; */
        /* margin: auto; */
        display: grid;
        grid-template-columns: 33% 33% 33%;
    }

    .repo {
        margin: 15px;
        border-radius: 15px;
        color: white;
        width: 95%;
        min-height: 250px;
    }
    .repo:hover * {
        border-color: var(--primary);
    }

    .repo * {
        text-decoration: none;
    }

    .header {
        background-color: var(--primary);
        padding: 1px;
        border-radius: 15px 15px 0px 0px;
        color: white;
    }

    .header > * {
        margin-top: 7px;
        margin-bottom: 7px;
        margin-left: 12px;
    }

    .description {
        color: black;
        padding: 5px;
        border-right: 1px solid black;
        border-left: 1px solid black;
        border-bottom: 1px solid black;
        min-height: 80%;
        border-radius: 0px 0px 15px 15px;
    }
</style>