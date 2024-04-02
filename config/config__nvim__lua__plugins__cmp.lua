return{ 
  {
    "hrsh7th/nvim-cmp",
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
        { "hrsh7th/cmp-nvim-lsp-signature-help", event = { "InsertEnter" } },
        { "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
        { "hrsh7th/cmp-path", event = { "InsertEnter" } },
        { "hrsh7th/cmp-emoji", event = { "InsertEnter" } },
        { "hrsh7th/cmp-cmdline", event = { "InsertEnter" } },
        { "hrsh7th/vim-vsnip", event = { "InsertEnter" } },
      },
      config = function()
        local cmp = require("cmp")

        require("cmp").setup{
          snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
              end,
            },
            sources = {

              { name = "nvim_lsp" },
              { name = "buffer" },
              { name = "path" },
              { name = "cmdline" },
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-p>"] = cmp.mapping.select_prev_item(),
              ["<C-n>"] = cmp.mapping.select_next_item(),
              ['<C-l>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm { select = true },
            }),
            experimental = {
              ghost_text = true,
            },
        }

    end,
  }, 
  { "hrsh7th/cmp-nvim-lsp"}, 
  { "hrsh7th/cmp-nvim-lsp-signature-help"}, 
  { "hrsh7th/cmp-buffer"}, 
  { "hrsh7th/cmp-path"}, 
  { "hrsh7th/cmp-emoji"}, 
  { "hrsh7th/cmp-cmdline"}, 
  { "hrsh7th/vim-vsnip"}, 
  { 'folke/lsp-colors.nvim'}, 
  { 'j-hui/fidget.nvim'}, 
}
