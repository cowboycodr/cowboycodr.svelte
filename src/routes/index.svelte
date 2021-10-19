<script context="module">
    export const ssr = false;
</script>

<script>
    import Navbar from "$lib/navbar.svelte";
</script>

<Navbar />

<div class="content">
    <h1>
        Hello.
    </h1>
    <h2>
        I'm <span class="primary-text">Kian</span>.
    </h2>
    <p>
        I am a software developer hobbyist and 9th grade student from Kansas.
    </p>
    <p>
        Outside of school and programming I enjoy Chic-fil-a, mountain biking, and hanging out with friends.
    </p>
</div>

<style>
    :root {
        font-family:  'Rubik';
    }

    .content {
        max-width: 700px;
        margin: auto;

        /* font-family: monospace; */
    }

    .content h1 {
        font-weight: 700;
        font-size: 5em;
    }

    .content h2 {
        font-size: 4em;
        font-weight: 500;
    }

    .content p {
        font-size: 2em;
        font-weight: 300;
    }
</style>