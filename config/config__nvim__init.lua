require("base")
require("keymaps")
require("plugins")
require("powerline")


-- setting color schema
vim.cmd [[

try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
