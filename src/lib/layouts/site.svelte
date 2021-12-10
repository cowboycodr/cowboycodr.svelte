<script context="module">
    export const ssr = false;
</script>

<script>
    import Footer from "$lib/components/footer.svelte";
    import Navbar from "$lib/components/navbar.svelte";

    export let maxHeight = true;
</script>

<Navbar />

<div
    class="container"
    class:maxHeight={maxHeight}
>
    <slot>Missing content!</slot>
</div>

<Footer />

<style>
    div > :global(.page) {
        min-height: 100vh;
    }

    .container {
        margin-bottom: 5%;
    }
</style>