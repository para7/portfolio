<script>
  // export let gap = "8px";
</script>

<div class={`container ${$$restProps.class || ""}}`}>
  <!-- style={`--grid-padding: ${gap}`} -->
  <slot></slot>
</div>

<style>
  .container {
    display: flex;
    width: 100%;
    flex-direction: row;
    flex-wrap: wrap;
    --grid-padding: 8px;

    /* grid-template-rows: 1fr;
    grid-template-columns: 1fr; */
  }
</style>
