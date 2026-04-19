return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  on_attach = function(client)
    -- Defer hover to basedpyright; ruff's hover is uninformative.
    client.server_capabilities.hoverProvider = nil
  end,
}
