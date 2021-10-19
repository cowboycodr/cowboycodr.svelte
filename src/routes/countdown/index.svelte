<script context="module">
    export const ssr = false;
</script>

<script>
    import Navbar from "$lib/navbar.svelte";

    let days = 0;
    let hours = 0;
    let minutes = 0;
    let seconds = 0;

    let end = new Date(2022, 5, 25, 14, 40, 0);

    setInterval(() => {
        const now = new Date();

        const diff = end.getTime() - now.getTime();

        days = Math.floor(diff / (1000 * 3600 * 24))
        hours = Math.floor(diff / (1000 * 3600 * 1440))
        minutes = Math.floor(diff / (1000 * 3600 * 84000)); 
        // seconds = Math.floor(diff / 1000);
    }, 1000);
</script>

<Navbar />

<div class="countdown-text primary-text">School ends in</div>
<div class="countdown-container">
    <div class="countdown">
        <div class="countdown-section">
            <div class="primary-text">{days}</div>
            <div>days</div>
        </div>
        <div class="countdown-section">
            <div class="primary-text">{hours}</div>
            <div>hours</div>
        </div>
        <div class="countdown-section">
            <div class="primary-text">{minutes}</div>
            <div>minutes</div>
        </div>
        <div class="countdown-section">
            <div class="primary-text">{seconds}</div>
            <div>seconds</div>
        </div>
    </div>
</div>
<div class="countdown-text">Revamp coming in may 2021</div>

<style>
    .countdown-text {
        margin: 10px;
        font-size: 20px;
        text-align: center;

        font-family: 'Rubik';
    }

    .countdown-container {
        display: flex;

        justify-content: center;
        align-items: center;

        font-family: 'Rubik';

        width: 100vw;
        min-height: 100%;

        background-color: white;
    }

    .countdown {
        display: flex;

        font-size: 12em;
    }

    .countdown-section {
        font-size: 60px;
        margin: 20px;

        text-align: center;
    }
</style>