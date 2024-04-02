return {
  { 'neovim/nvim-lspconfig' }, 
  { 'OmniSharp/omnisharp-vim', 
    init = function()
      vim.g.OmniSharp_server_use_net6 = 1
      vim.g.OmniSharp_server_use_mono = 0
    end,
  }, 
  {
    'williamboman/mason.nvim',
    config = function()
        require("mason").setup {}
    end,
  }, 
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      { "williamboman/mason.nvim"} ,
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
