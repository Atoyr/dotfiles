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
      { "<leader>ao", "<cmd>CopilotChatOpen<cr>",    desc = "Open Chat" },
      { "<leader>aq", "<cmd>CopilotChatClose<cr>",   desc = "Close Chat" },
      { "<leader>ar", "<cmd>CopilotChatReset<cr>",   desc = "Reset Chat" },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code",   mode = { "n", "v" } },
      { "<leader>af", "<cmd>CopilotChatFix<cr>",     desc = "Fix Code",       mode = { "n", "v" } },
      { "<leader>at", "<cmd>CopilotChatTests<cr>",   desc = "Generate Tests", mode = { "n", "v" } },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>",    desc = "Generate Docs",  mode = { "n", "v" } },
      { "<leader>aR", "<cmd>CopilotChatReview<cr>",  desc = "Review Code",    mode = { "n", "v" } },
    },
  },
}
