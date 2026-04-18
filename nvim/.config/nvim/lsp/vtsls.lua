local inlay_hints = {
  parameterNames = { enabled = "literals" },
  parameterTypes = { enabled = true },
  variableTypes = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
  enumMemberValues = { enabled = true },
}

return {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
  settings = {
    typescript = { inlayHints = inlay_hints },
    javascript = { inlayHints = inlay_hints },
    vtsls = {
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
    },
  },
}
