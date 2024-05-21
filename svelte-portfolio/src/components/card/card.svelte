<script>
  export let title;
  export let text = "";
</script>

<div class="container">
  <div class="title">{title}</div>
  <div class="text">{text}</div>
</div>

<style>
  .container {
    border: 2px solid;
    border-color: #88888888;
    width: 100%;
    padding: 12px;
    border-radius: 20px;
    /* box-shadow: 3px 3px 8px; */
  }

  .title {
    font-size: 3em;
    font-weight: 800;
  }
  .title {
    padding: 0.3em 0;
  }
  @media (768px <= width) {
    .title {
      padding: 0.8em 0;
    }
  }

  .text {
    /* transform: rotate(0.05deg); */
    /* font-weight: ; */
    font-size: 0.8rem;
  }
</style>
