<script context="module">
    export const ssr = false;
</script>

<script>
    import Site from "$lib/layouts/site.svelte";
    import Socials from "$lib/icons/socials.svelte";
</script>

<Site>
    <div class="content page">
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
            My favorite programming languages are Python, Rust, and JavaScript. 
        </p>
        <p>
            Outside of school and programming I enjoy Chic-fil-a, mountain biking, and hanging out with friends.
        </p>
        <p>
            Let's just waste more space in this area. 
        </p>
        <p>
            Even more?
        </p>
        <p>
            Lets add some more content I think we are getting near the end.
        </p>
        <Socials />
    </div>
</Site>

<style>
    :root {
        font-family:  'Rubik';
    }

    .content {
        min-height: 100%;
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