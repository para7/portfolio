<script lang="ts">
  import { GenerateBootstrapGridColClassName, type GridType } from "./grid";

  export let xs: GridType;
  // export let sm: GridType = undefined;
  export let md: GridType = undefined;
  // export let lg: GridType = undefined;
  // export let xl: GridType = undefined;

  const classNames = [
    GenerateBootstrapGridColClassName({ breakpoint: "xs", width: xs }),
    // GenerateBootstrapGridColClassName({ breakpoint: "sm", width: sm }),
    GenerateBootstrapGridColClassName({ breakpoint: "md", width: md }),
    // GenerateBootstrapGridColClassName({ breakpoint: "lg", width: lg }),
    // GenerateBootstrapGridColClassName({ breakpoint: "xl", width: xl }),
  ].join(" ");
</script>

<div class={`common ${classNames}`}>
  <slot></slot>
</div>

<style>
  .common {
    /* --grid-padding: 8px; */
    padding: var(--grid-padding);
  }

  :root {
    --grid-width-1: 8.33333333%;
    --grid-width-2: 16.66666667%;
    --grid-width-3: 25%;
    --grid-width-4: 33.33333333%;
    --grid-width-5: 41.66666667%;
    --grid-width-6: 50%;
    --grid-width-7: 58.33333333%;
    --grid-width-8: 66.66666667%;
    --grid-width-9: 75%;
    --grid-width-10: 83.33333333%;
    --grid-width-11: 91.66666667%;
    --grid-width-12: 100%;
  }

  @container style(--is-mobile: true) {
    .col-xs-1 {
      width: var(--grid-width-1);
    }
    .col-xs-2 {
      width: var(--grid-width-2);
    }
    .col-xs-3 {
      width: var(--grid-width-3);
    }
    .col-xs-4 {
      width: var(--grid-width-4);
    }
    .col-xs-5 {
      width: var(--grid-width-5);
    }
    .col-xs-6 {
      width: var(--grid-width-6);
    }
    .col-xs-7 {
      width: var(--grid-width-7);
    }
    .col-xs-8 {
      width: var(--grid-width-8);
    }
    .col-xs-9 {
      width: var(--grid-width-9);
    }
    .col-xs-10 {
      width: var(--grid-width-10);
    }
    .col-xs-11 {
      width: var(--grid-width-11);
    }
    .col-xs-12 {
      width: var(--grid-width-12);
    }
  }

  @container style(--is-pc: true) {
    .col-md-1 {
      width: var(--grid-width-1);
    }
    .col-md-2 {
      width: var(--grid-width-2);
    }
    .col-md-3 {
      width: var(--grid-width-3);
    }
    .col-md-4 {
      width: var(--grid-width-4);
    }
    .col-md-5 {
      width: var(--grid-width-5);
    }
    .col-md-6 {
      width: var(--grid-width-6);
    }
    .col-md-7 {
      width: var(--grid-width-7);
    }
    .col-md-8 {
      width: var(--grid-width-8);
    }
    .col-md-9 {
      width: var(--grid-width-9);
    }
    .col-md-10 {
      width: var(--grid-width-10);
    }
    .col-md-11 {
      width: var(--grid-width-11);
    }
    .col-md-12 {
      width: var(--grid-width-12);
    }
  }
</style>
