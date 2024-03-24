return {
  { 'neovim/nvim-lspconfig' }, 
  {
    'williamboman/mason.nvim',
    config = function()
        require("mason").setup {}
    end,
  }, 
  {
    'williamboman/mason-lspconfig.nvim',
    requires = {
      { "williamboman/mason.nvim"} ,
      { "neovim/nvim-lspconfig" },
    },

    wants = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require('mason-lspconfig').setup_handlers({ function(server_name)
      local opts = { }

      if server_name == "omnisharp" then
        local omnisharp_file_path = vim.fn.expand('$HOME/.local/share/nvim-data/mason/packages/omnisharp/omnisharp.cmd')
        opts.cmd = { omnisharp_file_path }
        vim.g.OmniSharp_server_use_net6 = 0
      end
      require("lspconfig")[server_name].setup(opts)
    end})
      require('mason-lspconfig').setup()
    end,
  },
}
