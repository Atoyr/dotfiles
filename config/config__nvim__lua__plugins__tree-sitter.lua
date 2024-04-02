return {
  -- Treesitter
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate", 
    event = "UIEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    lazy = {
      highlight = { enable = true },
      auto_install = false,
      ensure_installed = "all",
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
    config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
      parser_config.typescript.filetype_to_parsername = { "javascript", "typescript.tsx" }
      parser_config.javascript.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end, 
  }, 
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "CursorMoved",
  },
  { "nvim-telescope/telescope-file-browser.nvim" }, 
}
