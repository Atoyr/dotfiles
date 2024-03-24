--Remap space as leader key
vim.keymap.set("n", "<Space>", "<Nop>", opts)
vim.keymap.set("n", "s", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "`"

--[[
'' (an empty string)	mapmode-nvo	Normal, Visual, Select, Operator-pending
'n' Normal	:nmap
'v' Visual and Select
's' Select	:smap
'x' Visual	:xmap
'o' Operator-pending
'!' Insert and Command-line
'i' Insert	:imap
'l' Insert, Command-line, Lang-Arg
'c' Command-line
't' Terminal
--]]

-- setting key maps
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- 論理行descを表示行に置換
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
-- VisualModeで < > でのインデント後もViusalModeを維持
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- Bufferの切り替え
vim.keymap.set("n", "<Leader>j", ":bn<CR>", opts)
vim.keymap.set("n", "<Leader>k", ":bp<CR>", opts)
-- cancel hightlight
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<CR>", opts)
-- search keyword
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- split buffer for window
vim.keymap.set("n", "<Leader>s", ":split<CR>", opts)
vim.keymap.set("n", "<Leader>v", ":vsplit<CR>", opts)
-- select all
vim.keymap.set("n", "<Leader>a", "gg<S-v>G", opts)
-- terminal
vim.keymap.set("n", "<Leader>z", ":belowright term<CR>", opts)
-- auto space
vim.keymap.set("i", ",", ",<Space>", opts)
-- escape
vim.keymap.set("i", "<silent>jj", "<ESC>", opts)
vim.keymap.set("i", "<silent>ｊｊ", "<ESC>", opts)

-- lsp
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)

vim.api.nvim_create_autocmd("LspAttach", {
  -- TODO 
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local function lsp(desc)
      if desc then
        desc = "LSP: " .. desc
      end
      return { desc = desc, buffer = ev.buf }
    end
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, lsp("Show hover information"))
    vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, lsp("[F]ormat the current buffer"))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, lsp("Goto [R]eferences"))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp("Goto [d]efinition"))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lsp("Goto [D]eclaration"))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp("Goto [I]mplementation"))
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, lsp("Goto [T]ype definition"))
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, lsp("[n]ame rename"))
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, lsp("[a]ction"))
  end, 
})
