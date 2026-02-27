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
  laststatus = 3,
  expandtab = true,

  tabstop = 2,
  shiftwidth = 2,
  cursorline = true,

  number = true,
  relativenumber = true, -- 行番号を相対表示

  swapfile = false,      -- swapファイルを作成しない

  undofile = true,       -- 永続的なundofileを有効にする
  autoread = true,

  hidden = true,
  clipboard = "unnamedplus", -- システムクリップボードと連携
  virtualedit = "onemore",

  showmatch = true,
  termguicolors = true,

}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.scriptencoding = "utf-8"
vim.g.editorconfig_enable = true

vim.opt.completeopt = {
  "fuzzy",
  "popup",
  "menuone", -- show menu even if only one candidate
  "noinsert",
}
