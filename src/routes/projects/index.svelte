<script context="module">
    export const ssr = false;
</script>

<script>
    import Site from '$lib/layouts/site.svelte';
    import Repo from '$lib/components/repo.svelte';
</script>

<Site>
    <div class="page content">
        <h1>
            Current <span class="primary-text">Projects</span>:
        </h1>
        <h2>
            Cards. The in-progress, open-source, simplistic retake of social media.
        </h2>
        <h3>
            The goal of <Repo tag="cowboycodr/cards" content="cards" /> 
            is to make a twitter-like social media website. It is also a major learning 
            oppurtunity for me, for making and deploying a public website.
        </h3>
        <h3>
            The current status of it is in the beginning stages of development.
        </h3>
    </div>
</Site>

<style>
    * {
        font-family: 'Rubik';
    }

    h2::before {
        content: '';

        min-width: 3px;
        margin-right: 8px;

        background-color: var(--primary);

        border-radius: 20px;
    }

    h2:hover::before {
        min-width: 6px;
        margin-right: 5px;

        transition: .1s;
    }

    h2 {
        margin-top: 5%;

        display: flex;
    }

    h3 {
        font-weight: 500;

        padding-left: 5%;
        margin-left: 5%;

        border-left: 1px solid black;
    }

    .page {
        max-width: 660px;
        margin: auto;
    }
</style>