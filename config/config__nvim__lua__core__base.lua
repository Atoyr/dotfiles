vim.cmd("autocmd!")
vim.cmd("syntax on")

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",

  title = true, 
  hlsearch = true, 
	backup = false,
  showcmd = true, 
  cmdheight = 1, 
  laststatus = 2, 
	expandtab = true,

  tabstop = 2,
	shiftwidth = 2,
  cursorline = true,
  number = true,

  relativenumber = true,
	swapfile = false,

	undofile = true,
	autoread = true,

	hidden = true,
	clipboard = "unnamedplus",
	virtualedit = "onemore",

	showmatch = true,
  termguicolors = true, 

  laststatus = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.scriptencoding = "utf-8"
vim.g.editorconfig_enable = true


