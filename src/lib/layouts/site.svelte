<script context="module">
    export const ssr = false;
</script>

<script>
    import Footer from "$lib/components/footer.svelte";
    import Navbar from "$lib/components/navbar.svelte";
</script>

<Navbar />

<div class="container">
    <slot>Missing content!</slot>
</div>

<Footer />

<style>
    .container {
        min-height: 100%;
    }

    div:global(> .page) {
        min-height: 100vh;
    }
</style>