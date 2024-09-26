return {
  {
   "zbirenbaum/copilot.lua", 
   opts = {
     panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "<C-k>",
        jump_next = "<C-j>",
        accept = "<C-g>",
        refresh = "gr",
        open = "<C-s>"
      },
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4
      },
     }
   }
  }, 
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
