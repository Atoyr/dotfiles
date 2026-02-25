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
      server_opts_overrides = {
        trace = 'verbose',
        cmd = {
          vim.fn.expand("~/.local/share/nvim/mason/bin/copilot-language-server"),
          "--stdio"
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = true,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
        ["*"] = true,
      },
    },
  },

  -----------------------------------------------------------
  -- CopilotChat (Chat + Agent)
  -----------------------------------------------------------
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "auto",
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
