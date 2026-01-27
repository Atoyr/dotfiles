return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    config = function(_, opts)
      local ok, treesitter = pcall(require, "nvim-treesitter")
      if not ok then
        vim.notify("Failed to load nvim-treesitter", vim.log.levels.ERROR)
        return
      end

      treesitter.setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
        callback = function(ctx)
          -- pcallでエラーを無視することでパーサーやクエリがあるか気にしなくてすむ
          pcall(vim.treesitter.start)
        end,
      })
    end,
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        "vue",
        "typescript",
        "javascript",
        "json",
        -- あると便利
        "lua",
        "vim",
        "vimdoc",
        "query",
        "yaml",
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["al"] = "@call.outer",
            ["il"] = "@call.inner",
            ["aP"] = "@parameter.outer",
            ["iP"] = "@parameter.inner",
            ["ao"] = "@conditional.outer",
            ["io"] = "@conditional.inner",
            ["as"] = "@statement.outer",
          },
        },
      },
    },
  },

  -- Telescope file browser（telescope本体が別で入ってないなら依存も追加）
  { "nvim-telescope/telescope-file-browser.nvim" },
}
