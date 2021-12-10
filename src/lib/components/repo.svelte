<script>
    import Link from '$lib/components/link.svelte';

    export let tag = ''; // ex: cowboycodr/cards
    export let content = '';

    let href = "https://github.com/" + tag;
</script>

<Link 
    {href}
    newTab={false}
    style="font-weight: 500;"
>
    {content}
</Link>