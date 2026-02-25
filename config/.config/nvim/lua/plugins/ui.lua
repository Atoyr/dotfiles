return {
  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = {
      "BufWinEnter",
      "CmdwinLeave",
      "TabEnter",
      "TermEnter",
      "TextChanged",
      "VimResized",

      "WinEnter",
      "WinScrolled",
    },
    config = function()
      require("scrollbar").setup {}
    end,
  },

  -- indent
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({})
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },

  -- Color schema
  { 'EdenEast/nightfox.nvim' },
  { 'folke/tokyonight.nvim' },

  -- PowerLine
  { 'nvim-lualine/lualine.nvim' },

  -- css colorizer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  },

}
