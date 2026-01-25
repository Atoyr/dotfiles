---@type vim.lsp.Config
return {
  -- 初期化オプション
  init_options = {
    diagnosticSeverity = "Hint", -- "Error" | "Warning" | "Info" | "Hint"
  },
  filetypes = {
    "markdown",
    "text",
    "gitcommit",
    -- 必要に応じて追加
    "yaml",
    "lua",
    "typescript",
    "javascript",
    "vue",
  },
}
