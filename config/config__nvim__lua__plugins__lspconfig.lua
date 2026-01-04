return {
  { 'neovim/nvim-lspconfig' },
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    config = true,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { "mason-org/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "vue_ls", "eslint" },
    },
  },
}
