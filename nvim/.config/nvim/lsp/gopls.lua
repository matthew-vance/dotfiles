return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
