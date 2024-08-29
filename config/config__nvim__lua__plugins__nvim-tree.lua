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
    init = function()
      vim.keymap.set("n", "<C-n>", function()
        require("nvim-tree.api").tree.toggle()
        end)
    end,

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
        },
        filters = {
          dotfiles = true,
        },
      }
    end,
    -- version = 'nightly' -- optional, updated every week. (see issue #1193)
  }
}
