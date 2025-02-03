return {
  {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
    init = function()
      require("nvim-web-devicons").setup {
        default = true,
        override = {
          cs = {
            icon = ''
          }
        }
      }
    end,
  }, 
  {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,

    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },

    actions = {
      expand_all = {
        max_folder_discovery = 100,
        exclude = { '.git', 'target', 'build', 'node_modules' }
      },
    },

    config = function()
      require("nvim-tree").setup {
        sort_by = "case_sensitive",
        renderer = {
          group_empty = true,
          highlight_git = true,
          highlight_opened_files = "none",
        },
        filters = {
          dotfiles = true,
        },
      }

      vim.keymap.set("n", "<C-n>", function()
        require("nvim-tree.api").tree.toggle()
        end)
    end,
    -- version = 'nightly' -- optional, updated every week. (see issue #1193)
  }
}
