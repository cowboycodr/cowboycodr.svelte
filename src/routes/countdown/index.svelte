<script context="module">
    export const ssr = false;
</script>

<script>
    import Site from "$lib/layouts/site.svelte";

    let days = 0;
    let hours = 0;
    let minutes = 0;
    let seconds = 0;

    let end = new Date('May 25, 2022 14:40');

    function getTime(end) {
        const now = new Date();

        let delta = Math.abs(end.getTime() - now.getTime()) / 1000;

        days = Math.floor(delta / 86400);
        delta -= days * 86400;

        hours = Math.floor(delta / 3600) % 24;
        delta -= hours * 3600;

        minutes = Math.floor(delta / 60) % 60;
        delta -= minutes * 60;

        seconds = Math.floor(delta % 60);  
    }

    setInterval(() => {
        getTime(end);
    }, 1000);

    getTime(end);
</script>

<Site>
    <div class="page">
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
    </div>
</Site>

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