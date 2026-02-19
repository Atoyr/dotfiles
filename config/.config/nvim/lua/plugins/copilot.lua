return {
  -----------------------------------------------------------
  -- Copilot LSP (補完エンジン)
  -----------------------------------------------------------
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- blink.cmpに任せるので無効化
      panel = { enabled = false },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    build = "make tiktoken",        -- Only on MacOS or Linux
    opts = {
      debug = true,                 -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -----------------------------------------------------------
  -- CopilotChat (Chat + Agent)
  -----------------------------------------------------------
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-3.5-sonnet",
      window = {
        layout = "vertical",
        width = 0.4,
      },
      auto_insert_mode = true,
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<CR>",  desc = "CopilotChat Toggle" },
      { "<leader>ce", "<cmd>CopilotChatExplain<CR>", mode = "v",                 desc = "Explain" },
      { "<leader>cr", "<cmd>CopilotChatReview<CR>",  mode = "v",                 desc = "Review" },
      { "<leader>cf", "<cmd>CopilotChatFix<CR>",     mode = "v",                 desc = "Fix" },
      { "<leader>ct", "<cmd>CopilotChatTests<CR>",   mode = "v",                 desc = "Tests" },
      {
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, {
              selection = require("CopilotChat.select").buffer,
            })
          end
        end,
        desc = "Quick Chat",
      },
    },
  },
}
