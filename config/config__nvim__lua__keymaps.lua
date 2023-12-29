-- setting key maps
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
vim.keymap.set("n", "<Space>", "<Nop>", opts)
vim.keymap.set("n", "s", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "`"

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',

--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- change buffer
vim.keymap.set("n", "<Leader>j", ":bn<CR>", opts)
vim.keymap.set("n", "<Leader>k", ":bp<CR>", opts)

-- window split
vim.keymap.set("n", "<Leader>s", ":split<CR>", opts)
vim.keymap.set("n", "<Leader>v", ":vsplit<CR>", opts)


-- select all
vim.keymap.set("n", "<Leader>a", "gg<S-v>G", opts)

-- cancel hightlight
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<CR>", opts)

-- terminal
vim.keymap.set("n", "<Leader>z", ":belowright term<CR>", opts)

-- auto space
vim.keymap.set("i", ",", ",<Space>", opts)

vim.keymap.set("i", "<silent>jj", "<ESC>", opts)
vim.keymap.set("i", "<silent>ｊｊ", "<ESC>", opts)


