return {
  { 'neovim/nvim-lspconfig', lazy = true },
  { "mason-org/mason.nvim",  version = "^2.0.0", opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    version = "^2.0.0",
    dependencies = {
      { "mason-org/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls" },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- ここでサーバ個別の上書きを定義（旧 .setup の代わりに）
      -- lua
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })

      -- TypeScript
      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        root_markers = { "tsconfig.json", "package.json", ".git" },
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      })

      -- ESLint（整形はPrettierに任せる想定）
      vim.lsp.config("eslint", {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        settings = { format = false },
      })

      -- OmniSharp（必要なら .NET 6 を使う設定を維持）
      vim.lsp.config("omnisharp", {
        -- 追加設定が要る場合にここで
      })

      -- ※ automatic_enable=true なのでここで enable を明示しなくてもOK
      -- 明示したいなら：vim.lsp.enable({ "lua_ls", "ts_ls", "eslint", "omnisharp" })
    end,
  },
}
