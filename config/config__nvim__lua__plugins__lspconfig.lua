return {
  { 'neovim/nvim-lspconfig' }, 
  { 'OmniSharp/omnisharp-vim', 
    init = function()
      vim.g.OmniSharp_server_use_net6 = 1
      vim.g.OmniSharp_server_use_mono = 0
    end,
  }, 
  {
    'mason-org/mason.nvim',
    version = "^1.0.0", 
    config = function()
        require("mason").setup {}
    end,
  }, 
  {
    'mason-org/mason-lspconfig.nvim',
    version = "^1.0.0", 
    dependencies = {
      { "mason-org/mason.nvim" } ,
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require('mason-lspconfig').setup_handlers({ function(server_name)
        local opts = { }

        if server_name == "omnisharp" then
          vim.g.OmniSharp_server_use_net6 = 1
        end
        require("lspconfig")[server_name].setup(opts)
      end})
      require('mason-lspconfig').setup()
    end,
  },
}
