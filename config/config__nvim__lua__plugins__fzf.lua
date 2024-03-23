-- fzf
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      local function builtin(name)

        return function(opt)
          return function()
            return require("telescope.builtin")[name](opt or {})
            end
        end

      end

      local function extensions(name, prop)
        return function(opt)

          return function()

            local telescope = require "telescope"
            telescope.load_extension(name)
            return telescope.extensions[name][prop](opt or {})
          end
        end
      end


      vim.keymap.set("n", "<Leader>ff", builtin "find_files" {})
      vim.keymap.set("n", "<Leader>fg", builtin "live_grep" {})
      vim.keymap.set("n", "<Leader>fh", builtin "help_tags" { lang = "ja" })

      vim.keymap.set("n", "<Leader>fb", builtin "buffers" {})
    end,
    config = function()
      require("telescope").setup { }
    end
  }
}
