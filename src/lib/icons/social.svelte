<script>
    export let href;
</script>

<a href={href} target="_blank">
    <span class="social">
        <slot 
        name="icon"
        >
            <!-- optional fallback -->
        </slot>
    </span>
</a>

<style>
    .social:hover {
        fill: var(--primary);
    }
</style>