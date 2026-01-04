---@type vim.lsp.Config
return {
  cmd = {
    vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/bin/vue-language-server.js",
    "--stdio",
  },
}
