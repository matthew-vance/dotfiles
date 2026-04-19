return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html", "css", "scss", "less", "sass",
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
    "vue", "svelte", "astro",
  },
  root_markers = {
    "tailwind.config.js", "tailwind.config.cjs",
    "tailwind.config.mjs", "tailwind.config.ts",
    "postcss.config.js",
  },
}
