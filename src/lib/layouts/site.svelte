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

<div class="footer">
    <Footer />
</div>

<style>
    .container {
        min-height: 100%;
    }

    .footer {
        position: absolute;
        width: 100%;
        bottom: -200px;
    }
</style>