<script>
  export let onClose;
</script>

<div
  class="background"
  on:click|self={onClose}
>
  <div 
    class="modal"
  >
    <slot>
      Error loading in modal content
    </slot>
  </div>
</div>

<style>
  .background {
    position: absolute;

    width: 100vw;
    height: 100vh;

    background-color: rgba(196, 196, 196, 0.644);
  }

  .modal {
    position: absolute;

    top: 50%;
    left: 50%;

    transform: translate(-50%, -50%);
  }
</style>