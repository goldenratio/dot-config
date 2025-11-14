local wezterm = require 'wezterm'

-- Helper function to get the tab title
local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

-- Define tab_bar table and the format_tab_title function
local tab_bar = {}

function tab_bar.on_format_tab_title(tab, _tabs, _panes, _config, _hover, _max_width)
  local zoomed = ''
  local index = tab.tab_index + 1
  local title = tab_title(tab)
  if tab.active_pane.is_zoomed then
    zoomed = '+'
  end
  return {
    { Text = string.format(' %d %s%s ', index, title, zoomed) }
  }
end

-- Hook into wezterm event system
wezterm.on('format-tab-title', tab_bar.on_format_tab_title)

return {
  font = wezterm.font("JetBrainsMono Nerd Font Mono", {
    weight = "Regular",
  }),
  font_size = 14.0,
  color_scheme = "Monokai (dark) (terminal.sexy)",
  harfbuzz_features = { "calt=0", "liga=0", "clig=0" },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- use_resize_increments = true,
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
    background = "#1e1e1e",
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
      key = "LeftArrow",
      mods = "CMD|SHIFT",
      action = wezterm.action { ActivatePaneDirection = "Left" },
    },
    {
      key = "RightArrow",
      mods = "CMD|SHIFT",
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
      key = "c",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "c", mods = "CTRL" },
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
    {
      key = "v",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "v", mods = "CTRL" },
    },
    {
      key = "w",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "w", mods = "CTRL" },
    },
    {
      key = "x",
      mods = "CMD|SHIFT",
      action = wezterm.action.ActivateCopyMode,
    },
    {
      key = 'Space',
      mods = 'CMD|SHIFT',
      action = wezterm.action.QuickSelect,
    },
    {
      key = "P",
      mods = "CMD|SHIFT",
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      key = "v",
      mods = "CMD|SHIFT",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
    {
      key = "w",
      mods = "CMD|SHIFT",
      action = wezterm.action.CloseCurrentTab { confirm = true }
    },
    { key = '{', mods = 'SHIFT|ALT', action = wezterm.action.MoveTabRelative(-1) },
    { key = '}', mods = 'SHIFT|ALT', action = wezterm.action.MoveTabRelative(1) }
  },
}
