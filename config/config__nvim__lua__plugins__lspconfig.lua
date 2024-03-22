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
      opts.on_attach = function(_, bufnr)

        local bufopts = { silent = true , buffer = bufnr, noremap = true}
        -- TODO change vim.keymap.set
        vim.keymap.set('n', 'K',  'vim.lsp.buf.hover', bufopts)
        vim.keymap.set('n', 'gf', 'vim.lsp.buf.formatting', bufopts)
        vim.keymap.set('n', 'gr', 'vim.lsp.buf.references', bufopts)
        vim.keymap.set('n', 'gd', 'vim.lsp.buf.definition', bufopts)
        vim.keymap.set('n', 'gD', 'vim.lsp.buf.declaration', bufopts)
        vim.keymap.set('n', 'gi', 'vim.lsp.buf.implementation', bufopts)
        vim.keymap.set('n', 'gt', 'vim.lsp.buf.type_definition', bufopts)
        vim.keymap.set('n', 'gn', 'vim.lsp.buf.rename', bufopts)
        vim.keymap.set('n', 'ga', 'vim.lsp.buf.code_action', bufopts)
        vim.keymap.set('n', 'ge', 'vim.diagnostic.open_float', bufopts)
        vim.keymap.set('n', 'g]', 'vim.diagnostic.goto_next', bufopts)
        vim.keymap.set('n', 'g[', 'vim.diagnostic.goto_prev', bufopts)
      end

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
