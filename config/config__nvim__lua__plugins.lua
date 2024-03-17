local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
    })
  print("Installing packer close and reopen Neovim...")
vim.cmd([[packadd packer.nvim]])
  end

  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  vim.cmd([[
      augroup packer_user_config
      autocmd!

      autocmd BufWritePost plugins.lua source <afile> | PackerSync
      augroup end
  ]])

  -- Use a protected call so we don't error out on first use
  local status_ok, packer = pcall(require, "packer")
  if not status_ok then
  return
  end

  -- Have packer use a popup window
  packer.init({
      display = {
      open_fn = function()
      return require("packer.util").float({ border = "rounded" })

      end,
      },
      })

  -- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    -- Package Manager
    use 'wbthomason/packer.nvim'

    -- lua module
    use "nvim-lua/plenary.nvim"

    -- Visual
    use 'nvim-tree/nvim-web-devicons'
    use 'folke/todo-comments.nvim'

    use {
      "petertriho/nvim-scrollbar",
      event = {
        "BufWinEnter",
        "CmdwinLeave",
        "TabEnter",
        "TermEnter",
        "TextChanged",
        "VimResized",

        "WinEnter",
        "WinScrolled",
      },
      config = function()
        require("scrollbar").setup {}
      end,
    }


-- noice
use "MunifTanjim/nui.nvim"
use {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup{
      render = "minimal"
    }
    vim.notify = notify
  end,
}

-- Color schema
use 'EdenEast/nightfox.nvim'
use 'folke/tokyonight.nvim'


-- LSP and autocomplete

use 'neovim/nvim-lspconfig'
use {
  'williamboman/mason.nvim',
  config = function()

      require("mason").setup {}

  end,
}
use {
  'williamboman/mason-lspconfig.nvim',

    requires = {
      { "williamboman/mason.nvim"} ,
      { "neovim/nvim-lspconfig" },

  },

  wants = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
  },
  config = function()
    require('mason-lspconfig').setup_handlers({ function(server_name)
    local opts = { }
    opts.on_attach = function(_, bufnr)

      local bufopts = { silent = true , buffer = bufnr, noremap = true}
      -- TODO change vim.keymap.set
      vim.keymap.set('n', 'K',  'vim.lsp.buf.hover', bufopts)
      vim.keymap.set('n', 'gf', 'vim.lsp.buf.formatting', bufopts)
      vim.keymap.set('n', 'gr', 'vim.lsp.buf.references', bufopts)
      vim.keymap.set('n', 'gd', 'vim.lsp.buf.definition', bufopts)
      vim.keymap.set('n', 'gD', 'vim.lsp.buf.declaration', bufopts)
      vim.keymap.set('n', 'gi', 'vim.lsp.buf.implementation', bufopts)
      vim.keymap.set('n', 'gt', 'vim.lsp.buf.type_definition', bufopts)
      vim.keymap.set('n', 'gn', 'vim.lsp.buf.rename', bufopts)
      vim.keymap.set('n', 'ga', 'vim.lsp.buf.code_action', bufopts)
      vim.keymap.set('n', 'ge', 'vim.diagnostic.open_float', bufopts)
      vim.keymap.set('n', 'g]', 'vim.diagnostic.goto_next', bufopts)
      vim.keymap.set('n', 'g[', 'vim.diagnostic.goto_prev', bufopts)
    end

    if server_name == "omnisharp" then
      local omnisharp_file_path = vim.fn.expand('$HOME/.local/share/nvim-data/mason/packages/omnisharp/omnisharp.cmd')
      opts.cmd = { omnisharp_file_path }
      vim.g.OmniSharp_server_use_net6 = 0
    end
    require("lspconfig")[server_name].setup(opts)
  end})
    require('mason-lspconfig').setup()
  end,
}

-- GitHub Copilot
use({
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true

    local keymap = vim.keymap.set
    -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
    keymap(
      "i",
      "<C-g>",

      'copilot#Accept("<CR>")',
      { silent = true, expr = true, script = true, replace_keycodes = false }
    )

    keymap("i", "<C-j>", "<Plug>(copilot-next)")
    keymap("i", "<C-k>", "<Plug>(copilot-previous)")
    keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")

    keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
  end,
})

-- editor config
use "gpanders/editorconfig.nvim"

-- cmp
use {
  "hrsh7th/nvim-cmp",

    module = { "cmp" },
    requires = {
      { "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
      { "hrsh7th/cmp-nvim-lsp-signature-help", event = { "InsertEnter" } },
      { "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
      { "hrsh7th/cmp-path", event = { "InsertEnter" } },
      { "hrsh7th/cmp-emoji", event = { "InsertEnter" } },
      { "hrsh7th/cmp-cmdline", event = { "InsertEnter" } },
      { "hrsh7th/vim-vsnip", event = { "InsertEnter" } },
    },
    config = function()
      local cmp = require("cmp")

      require("cmp").setup{
        snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          sources = {

            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "cmdline" },
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ['<C-l>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm { select = true },
          }),
          experimental = {
            ghost_text = true,
          },
      }

  end,
}
use "hrsh7th/cmp-nvim-lsp"
use "hrsh7th/cmp-nvim-lsp-signature-help"
use "hrsh7th/cmp-buffer"

use "hrsh7th/cmp-path"
use "hrsh7th/cmp-emoji"
use "hrsh7th/cmp-cmdline"
use "hrsh7th/vim-vsnip"
use 'folke/lsp-colors.nvim'
-- use 'folke/trouble.nvim'
use 'j-hui/fidget.nvim'

-- fzf
use {
  "nvim-telescope/telescope.nvim",
    module = { "telescope" },
    requires = { "nvim-lua/plenary.nvim" },
    wants = { },
    setup = function()
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
      vim.keymap.set("n", "<Leader>fh", builtin "help_tags" { lang = "en" })

      vim.keymap.set("n", "<Leader>fb", builtin "buffers" {})
      end,
    config = function()
      require("telescope").setup {

      }
  end
}


-- PowerLine
use 'nvim-lualine/lualine.nvim'

-- Fileruse

use {
  'nvim-tree/nvim-tree.lua',

--     keys = {
--       {"n", "<C-n>" }
--    },
    module = { "nvim-tree" },
    setup = function()
      vim.keymap.set("n", "<C-n>", function()
          require("nvim-tree.api").tree.toggle()
          end)
      end,

    requires = {
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
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

-- Git
use{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup{}
  end
}

-- Treesitter
use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
use({ "nvim-telescope/telescope-file-browser.nvim" })

-- etc
-- Template
use{
  "mattn/sonictemplate-vim",
  config = function()
    vim.g.sonictemplate_vim_template_dir = {

      '$HOME/.vim/template',
      '$HOME/template'}
  end
}
-- TODO
use {

  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup { }
  end
}
-- colorizer
use {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup { }
  end
}
-- Indent
use {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup {

    }
  end
}
-- auto pairs
use {
	"windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {}
  end
}

use {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup{}
  end
}

-- use{
--   "Maan2003/lsp_lines.nvim",
--   config = function()

--     require("lsp_lines").setup()
--   end,
-- }

use {
  "kevinhwang91/nvim-hlslens",

  setup = function()
    local kopts = {noremap = true, silent = true}
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
  end,
  config = function()
    require("hlslens").setup{}
  end
}
use {
	"tversteeg/registers.nvim",
	config = function()
		require("registers").setup()
	end,
}

use {
  'norcalli/nvim-colorizer.lua', 
  config = function()
    require("colorizer").setup()
  end,
}
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
  require("packer").sync()
end
end)
