return {
  -- {
  --   'Wansmer/treesj',
  --   -- keys = { '<space>u', '<space>i', '<space>o' },
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('treesj').setup({})
  --   end,
  -- },

  -- editor config
  { "gpanders/editorconfig.nvim" },

  -- notify
  { "MunifTanjim/nui.nvim" },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")

      notify.setup {
        render = "minimal"
      }
      vim.notify = notify
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      local kopts = { noremap = true, silent = true }
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
    end
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  -- <C-a> <C-x>
  {
    "monaqa/dial.nvim",
    config = function()
    end
  },

  -- register
  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end,
  },

  -- key support
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    opts = {
    }
  },

  -- outline navigation
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  {
    "j-hui/fidget.nvim",
  },

  -- debug
  --
  {
    'mfussenegger/nvim-dap',
    config = function()
      -- nvim-dapのNode.js設定例
      local dap = require('dap')
      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { os.getenv('HOME') .. '/.vscode/extensions/ms-vscode.node-debug2/out/src/nodeDebug.js' },
      }
      dap.configurations.javascript = {
        {
          type = 'node2',
          request = 'launch',
          program = '${workspaceFolder}/node_modules/.bin/remix', -- Remixアプリを実行
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
      }
    end,
  }
}
