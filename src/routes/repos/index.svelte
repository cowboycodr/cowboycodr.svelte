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
                <div class="repo">
                    <h1 class="name">
                        {repo.name}
                    </h1>
                    <div class="description">
                        {repo.description}
                    </div>
                </div>
            {/each}
        {/if}
    </div>
</Site>

<style>
    .content {
        display: grid;
        grid-template-columns: 50% 50%;
        grid-gap: 20px;
        justify-content: center;

        margin: auto;
        margin-top: 5%;

        max-width: 1000px;
    }

    .repo {
        width: 90%;
        min-height: 300px;

        border-radius: 20px;


        margin-bottom: 10px;

        box-shadow: 0 2px 43px -4px #4b4b4b;
    }

    .repo:hover {
        box-shadow: 0 2px 43px -4px var(--primary);

        transition: .25s;
    }

    .repo > .name {
        margin: 0 0 0 0;
        border-radius: 20px 20px 0 0;

        padding: 5px;
        color: white;

        background-color: var(--primary);
    }

    .repo > .description {
        padding: 5px;

        font-size: 22px;
    }
</style>