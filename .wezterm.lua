local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Appearance
config.color_scheme = 'Kasugano (terminal.sexy)'
config.window_background_opacity = 0.95
config.win32_system_backdrop = 'Mica'

config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0cell', 
}

config.colors = {
  selection_bg = '#2d4f67',
  selection_fg = '#c8c093',
  cursor_bg = '#c8c093',
  cursor_fg = '#1f1f28',
}

-- Window behavior
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.scrollback_lines = 10000

-- Startup environment
config.default_prog = { 'wsl.exe', '--cd', '~' }

-- Multiplexer keybindings
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Send leader key
  { key = 'a', mods = 'LEADER|CTRL', action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' } },

  -- Split panes
  { key = 'v', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 's', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  
  -- Change pane focus
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Left') },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Right') },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Up') },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Down') },
  
  { key = 'LeftArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Left') },
  { key = 'RightArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Right') },
  { key = 'UpArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Up') },
  { key = 'DownArrow', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection('Down') },
  
  -- Modify pane state
  { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },
  { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
}

return config