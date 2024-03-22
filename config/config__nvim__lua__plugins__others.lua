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

  -- template
  {
    "mattn/sonictemplate-vim",
    config = function()
      vim.g.sonictemplate_vim_template_dir = {
        '$HOME/.vim/template',
        '$HOME/template'}
    end
  }, 

  -- editor config
  { "gpanders/editorconfig.nvim"}, 

  -- Color schema
  { 'EdenEast/nightfox.nvim' }, 
  { 'folke/tokyonight.nvim'}, 

  -- noice
  { "MunifTanjim/nui.nvim" }, 
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")

      notify.setup{
        render = "minimal"
      }
      vim.notify = notify
    end,
  }, 

  -- PowerLine
  { 'nvim-lualine/lualine.nvim'}, 

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }, 
  { "nvim-telescope/telescope-file-browser.nvim" }, 
  -- css colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup { }
    end
  }, 
  -- Git Sign
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup{}
    end
  }, 
  -- Indent
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup {

      }
    end
  }, 
  {
    "kevinhwang91/nvim-hlslens",

    setup = function()
      local kopts = {noremap = true, silent = true}
      vim.api.nvim_set_keymap('n', 'n',
          [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap('n', 'N',
          [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end,
    config = function()
      require("hlslens").setup{}
    end
  }, 

  -- TODO TOOL
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup { }
    end
  }, 

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }, 

  -- register
  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end,
  }

--  {
--    "j-hui/fidget.nvim",
--    config = function()
--      require("fidget").setup{}
--    end
--  }, 
}
