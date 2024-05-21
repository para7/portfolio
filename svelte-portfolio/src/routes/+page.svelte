<script>
  import Card from "../components/card/card.svelte";
  import GridContainer from "$lib/components/layouts/grid/GridContainer.svelte";
  import Grid from "$lib/components/layouts/grid/Grid.svelte";
</script>

<svelte:head>
  <title>Nana Portfolio</title>
  <meta name="description" content="Nana Portfolio" />
</svelte:head>

<div class="page">
  <div class="title">Nana's Portfolio</div>

  <div class="center">
    <GridContainer>
      <Grid xs={12} md={4}>
        <Card title="Blog" text="工事中…"></Card></Grid
      >
      <Grid xs={12} md={4}>
        <!-- <Card title="Works" text="つくったもの"></Card> -->
        <Card title="Works" text="工事中…"></Card>
      </Grid>
      <Grid xs={12} md={4}>
        <Card title="Resume" text="工事中…"></Card>
        <!-- <Card title="Resume" text="経歴など"></Card></Grid -->
      </Grid>
    </GridContainer>
  </div>
</div>

<style>
  .title {
    text-align: center;
    font-size: 3rem;
    font-weight: 800;
  }
  @media (768px <= width) {
    .title {
      margin-bottom: 6rem;
    }
  }
  .page {
    display: flex;
    flex-direction: column;
  }
  .center {
    height: 100%;
    justify-content: center;
  }
</style>
