return {
  settings = {
    basedpyright = {
      analysis = {
        -- Default is "workspace" which analyses the entire project. Scope to
        -- open files for faster feedback in large repos.
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
