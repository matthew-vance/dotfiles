return {
  on_attach = function(client)
    -- eslint-language-server has a bug with textDocument/diagnostic (pull model)
    -- where it fails to resolve file paths. Forces push diagnostics instead.
    client.server_capabilities.diagnosticProvider = nil
  end,
}
