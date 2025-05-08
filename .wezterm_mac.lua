local wezterm = require 'wezterm'

return {
  font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
  font_size = 14.0,
  color_scheme = "Monokai (dark) (terminal.sexy)",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  use_resize_increments = true,
  use_fancy_tab_bar = true,
  -- Set the initial window size (columns x rows) adsds
  initial_cols = 220,
  initial_rows = 60,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = "BlinkingBlock",
  colors = {
    cursor_bg = "white",
    cursor_fg = "black",     -- optional: text color under the cursor
    cursor_border = "white", -- optional: border color of the cursor
    background = "#1E1E1E",
  },
  keys = {
    {
      key = 'D',
      mods = 'CMD',
      action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = 'd',
      mods = 'CMD',
      action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = "[",
      mods = "CMD",
      action = wezterm.action { ActivatePaneDirection = "Left" },
    },
    {
      key = "]",
      mods = "CMD",
      action = wezterm.action { ActivatePaneDirection = "Right" },
    },
    {
      key = 'UpArrow',
      mods = 'CMD|SHIFT',
      action = wezterm.action { ActivatePaneDirection = "Up" },
    },
    {
      key = 'DownArrow',
      mods = 'CMD|SHIFT',
      action = wezterm.action { ActivatePaneDirection = "Down" },
    },
    {
      key = 'Enter',
      mods = 'CMD|SHIFT',
      action = wezterm.action.TogglePaneZoomState,
    },
    { key = '1', mods = 'CMD', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'CMD', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'CMD', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'CMD', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'CMD', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'CMD', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'CMD', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'CMD', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'CMD', action = wezterm.action.ActivateTab(-1) }, -- last tab
    -- mac crap
    {
      key = "s",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "s", mods = "CTRL" },
    },
    {
      key = "y",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "y", mods = "CTRL" },
    },
    {
      key = "DownArrow",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "DownArrow", mods = "CTRL" },
    },
    {
      key = "LeftArrow",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "LeftArrow", mods = "CTRL" },
    },
    {
      key = "RightArrow",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "RightArrow", mods = "CTRL" },
    },
    {
      key = "r",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "r", mods = "CTRL" },
    },
    {
      key = "k",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "k", mods = "CTRL" },
    },
    {
      key = "x",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "x", mods = "CTRL" },
    },
    {
      key = "o",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "o", mods = "CTRL" },
    },
    {
      key = "i",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "i", mods = "CTRL" },
    },
  },
}
