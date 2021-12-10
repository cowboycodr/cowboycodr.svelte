<script context="module">
    export const ssr = false;
</script>

<script>
    import { page } from '$app/stores';
    import { onMount } from 'svelte';

    export let href = $page.path;
    export let style = '';
    export let newTab = false;

    let target = "_blank" ? newTab : "";
</script>

<span class="link">
    <a {href} {style} {target}>
        <slot>link</slot>
    </a>
</span>

<style>
    a {
        color: inherit;

        text-decoration: none;
        font-size: inherit;
    }
</style>