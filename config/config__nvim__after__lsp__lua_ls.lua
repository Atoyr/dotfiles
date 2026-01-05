---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      diagnostics = {
        unusedLocalExclude = { '_*' },
        globals = { 'vim' }
      }
    }
  }
}
