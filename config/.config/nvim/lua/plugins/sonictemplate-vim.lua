return {
  -- template
  {
    "mattn/sonictemplate-vim",
    config = function()
      vim.g.sonictemplate_vim_template_dir = {
        '$HOME/.vim/template',
        '$HOME/template'
      }
    end, 
  }, 
}
