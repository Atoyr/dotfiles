return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              "node_modules",
              ".cache",
              ".next",
              ".nuxt",
              "target",
            },
          },
        },
        enable_git_status = true,
        window = {
          mappings = {
            ["<C-n>"] = "close_window",
          },
        },
        default_component_configs = {
          name = {
            trailing_slash = false,
            use_filtered_colors = true, -- Whether to use a different highlight when the file is filtered (hidden, dotfile, etc.).
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added = "+",    -- or "✚"
              modified = "M", -- or ""
              deleted = "D",  -- this can only be used in the git_status source
              renamed = "R",  -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        }
      })

      vim.keymap.set("n", "<C-n>", function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end)
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
  --   {
  --     'nvim-tree/nvim-web-devicons', -- optional, for file icons
  --     init = function()
  --       require("nvim-web-devicons").setup {
  --         default = true,
  --         override = {
  --           cs = {
  --             icon = ''
  --           }
  --         }
  --       }
  --     end,
  --   },
  --   {
  --     'nvim-tree/nvim-tree.lua',
  --     version = "*",
  --     lazy = false,
  --
  --     dependencies = {
  --       'nvim-tree/nvim-web-devicons', -- optional, for file icons
  --     },
  --
  --     actions = {
  --       expand_all = {
  --         max_folder_discovery = 100,
  --         exclude = { '.git', 'target', 'build', 'node_modules' }
  --       },
  --     },
  --
  --     config = function()
  --       require("nvim-tree").setup {
  --         sort_by = "case_sensitive",
  --         renderer = {
  --           group_empty = true,
  --           highlight_git = true,
  --           highlight_opened_files = "none",
  --         },
  --         filters = {
  --           dotfiles = true,
  --         },
  --       }
  --
  --       vim.keymap.set("n", "<C-n>", function()
  --         require("nvim-tree.api").tree.toggle()
  --         end)
  --     end,
  --     -- version = 'nightly' -- optional, updated every week. (see issue #1193)
  --   }
}
