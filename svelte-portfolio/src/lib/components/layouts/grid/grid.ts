export type GridType = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | "auto" | undefined;

type Breakpoint = "xs" | "sm" | "md" | "lg" | "xl";

export const GenerateBootstrapGridColClassName = (args: {
  breakpoint: Breakpoint;
  width: GridType | undefined;
}): string | undefined => {
  if (args.width === undefined) {
    return "";
  }

  return `col-${args.breakpoint}-${args.width}`;
};
