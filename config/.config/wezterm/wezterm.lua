local wezterm = require 'wezterm'

local config = {}

-- judge OS
local is_windows = wezterm.target_triple:find("windows") ~= nil
local is_macos = wezterm.target_triple:find("darwin") ~= nil

-- defalut shell
if is_windows then
  config.default_prog = { 'powershell.exe' }
elseif is_macos then
  config.default_prog = { '/bin/zsh' }
end

-- Font settings migrated from Alacritty
config.font = wezterm.font('CaskaydiaCove Nerd Font')
config.font_size = 14.0

-- Environment variables
config.set_environment_variables = {
  TERM = 'wezterm',
}

-- Performance settings
config.front_end = "OpenGL"
config.max_fps = 120

-- Mac opt settings
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- auto reload config
config.automatically_reload_config = true
wezterm.on('window-config-reloaded', function(window, pane)
  wezterm.log_info 'the config was reloaded for this window!'
end)

-- update wezterm
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

-- IME (for Windows)
config.use_ime = true
config.ime_preedit_rendering = "Builtin"

-- scroll backline
config.scrollback_lines = 35000
config.initial_cols = 120
config.initial_rows = 30

-- tab config
config.hide_tab_bar_if_only_one_tab = true

-- Color scheme migrated (Tokyo Night-like)
-- config.color_scheme = 'Tokyo Night'
config.colors = {
  foreground = '#a9b1d6',
  background = '#1a1b26',
  ansi = {
    '#32344a', -- black
    '#f7768e', -- red
    '#9ece6a', -- green
    '#e0af68', -- yellow
    '#7aa2f7', -- blue
    '#ad8ee6', -- magenta
    '#449dab', -- cyan
    '#787c99', -- white
  },
  brights = {
    '#444b6a', -- black
    '#ff7a93', -- red
    '#b9f27c', -- green
    '#ff9e64', -- yellow
    '#7da6ff', -- blue
    '#bb9af7', -- magenta
    '#0db9d7', -- cyan
    '#acb0d0', -- white
  },
}

config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

-- Key bindings migrated from Alacritty
config.keys = {
  { key = 'N', mods = 'CTRL|ALT',   action = wezterm.action.SpawnWindow },
  { key = 'Z', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateCopyMode },
}

-- Optional: explicit font rules for bold/italic
config.font_rules = {
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font('CaskaydiaCove Nerd Font', { weight = 'Bold' }),
  },
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font('CaskaydiaCove Nerd Font', { weight = 'Bold', italic = true }),
  },
  {
    intensity = 'Normal',
    italic = true,
    font = wezterm.font('CaskaydiaCove Nerd Font', { italic = true }),
  },
}

-- Hyperlink rules
-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wezterm/wezterm | "wezterm/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = 'https://www.github.com/$1/$3',
})

return config
