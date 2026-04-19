return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "astro",
  },
  root_markers = {
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "eslint.config.ts",
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
    "package.json",
    ".git",
  },
  settings = {
    workingDirectory = { mode = "auto" },
  },
  on_attach = function(client)
    -- eslint-language-server has a bug with textDocument/diagnostic (pull model)
    -- where it fails to resolve file paths. Forces push diagnostics instead.
    client.server_capabilities.diagnosticProvider = nil
  end,
}
