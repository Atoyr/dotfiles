return {
  -- telescope.nvim: Fuzzy finder and more
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Telescope Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Telescope Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Telescope Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Telescope Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Telescope Recent Files" },
      { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Telescope Git Commits" },
      { "<leader>fs", "<cmd>Telescope git_status<cr>",  desc = "Telescope Git Status" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Telescope Diagnostics" },
      { "<C-p>",      "<cmd>Telescope find_files<cr>",  desc = "Telescope Find Files" },
    },
    config = function()
      local telescope = require "telescope"
      local actions = require "telescope.actions"
      telescope.setup {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          sorting_strategy = "ascending",
          layout_config = { horizontal = { prompt_position = "top", preview_width = 0.55 } },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<Esc>"] = actions.close,
            },
          },
          file_ignore_patterns = { "node_modules", ".git/", "target/", "dist/", "build/" },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
        },
        extensions = {
          fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
          ["ui-select"] = { require("telescope.themes").get_dropdown() },
        },
      }
      telescope.load_extension "fzf"
      telescope.load_extension "ui-select"
    end,
  },

  -- overlook.nvim: Code peek in floating popups
  {
    "WilliamHsieh/overlook.nvim",
    event = "LspAttach",
    keys = {
      { "<leader>pd", function() require("overlook").open_definition() end,  desc = "Peek Definition" },
      { "<leader>pc", function() require("overlook").close_all() end,        desc = "Close All Popups" },
      { "<leader>pu", function() require("overlook").restore_one() end,      desc = "Restore Last Popup" },
      { "<leader>pU", function() require("overlook").restore_all() end,      desc = "Restore All Popups" },
      { "<leader>pf", function() require("overlook").toggle_focus() end,     desc = "Toggle Focus" },
      { "<leader>ps", function() require("overlook").open_in_split() end,    desc = "Open in Split" },
      { "<leader>pv", function() require("overlook").open_in_vsplit() end,   desc = "Open in VSplit" },
      { "<leader>po", function() require("overlook").open_in_original() end, desc = "Open in Original" },
    },
    opts = {
      border = "rounded",
      max_width = 100,
      max_height = 20,
    },
  },

  -- nvim-hlslens: Highlight search results with lens
  {
    "kevinhwang91/nvim-hlslens",
    keys = {
      -- n / N キー (countに対応させるため expr を使用)
      { 'n',         [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Next search result with hlslens" },
      { 'N',         [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Prev search result with hlslens" },

      -- * / # / g* / g# キー
      { '*',         [[*<Cmd>lua require('hlslens').start()<CR>]],                                             desc = "Search word under cursor" },
      { '#',         [[#<Cmd>lua require('hlslens').start()<CR>]],                                             desc = "Search word under cursor (backwards)" },
      { 'g*',        [[g*<Cmd>lua require('hlslens').start()<CR>]],                                            desc = "Search word under cursor (partial)" },
      { 'g#',        [[g#<Cmd>lua require('hlslens').start()<CR>]],                                            desc = "Search word under cursor (partial backwards)" },

      -- ハイライト消去
      { '<Leader>l', '<Cmd>noh<CR>',                                                                           desc = "Clear search highlight" },
    }
  },

}
