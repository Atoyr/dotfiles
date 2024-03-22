return {
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

    config = function()
      require("nvim-tree").setup {
        sort_by = "case_sensitive",

        view = {
          width = 30,
          mappings = {
            list = {
              { key = "U", action = "dir_up" },

            },
          },
        },

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
