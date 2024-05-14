return {
 "zbirenbaum/copilot.lua", 
 opts = {
   panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "<C-k>",
      jump_next = "<C-j>",
      accept = "<C-g>",
      refresh = "gr",
      open = "<C-s>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
   }
 }
}
