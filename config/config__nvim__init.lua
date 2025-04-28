require("core.base")
require("core.keymaps")
require("core.lazy")
require("core.autocmd")
require("core.powerline")


-- setting color schema
vim.cmd [[

try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
