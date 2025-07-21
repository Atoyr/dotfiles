return {
  -- Treesitter
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate", 
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = 'nvim-treesitter.configs', 
    opts = {
      highlight = { enable = true },
      ensure_installed={ "vue", "typescript", "javascript", "json"}, 
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["al"] = "@call.outer",
            ["il"] = "@call.inner",
            ["aP"] = "@parameter.outer",
            ["iP"] = "@parameter.inner",
            ["ao"] = "@conditional.outer",
            ["io"] = "@conditional.inner",
            ["as"] = "@statement.outer",
          },
        },
      },
    }, 
  }, 
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "CursorMoved",
  },
  { "nvim-telescope/telescope-file-browser.nvim" }, 
}
