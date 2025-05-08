local wezterm = require 'wezterm'

return {
  -- front_end = "OpenGL",
  font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
  font_size = 10.0,
  color_scheme = "Monokai (dark) (terminal.sexy)",
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },
  use_resize_increments = true,
  use_fancy_tab_bar = true,
  -- Set the initial window size (columns x rows)
  initial_cols = 220,
  initial_rows = 60,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = "BlinkingBlock",
  colors = {
    cursor_bg = "white",
    cursor_fg = "black",     -- optional: text color under the cursor
    cursor_border = "white", -- optional: border color of the cursor
    background = "#1e1e1e",
  },
  keys = {
    {
      key = 'D',
      mods = 'CTRL',
      action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = 'd',
      mods = 'CTRL',
      action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = "[",
      mods = "CTRL",
      action = wezterm.action { ActivatePaneDirection = "Left" },
    },
    {
      key = "]",
      mods = "CTRL",
      action = wezterm.action { ActivatePaneDirection = "Right" },
    },
    {
      key = 'UpArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action { ActivatePaneDirection = "Up" },
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action { ActivatePaneDirection = "Down" },
    },
    {
      key = 'Enter',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = "t",
      mods = "CTRL",
      action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
      key = 'v',
      mods = 'CTRL',
      action = wezterm.action.PasteFrom 'Clipboard',
    },
    { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'CTRL', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'CTRL', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'CTRL', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'CTRL', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'CTRL', action = wezterm.action.ActivateTab(-1) }, -- last tab
  },
}
