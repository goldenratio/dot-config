local wezterm = require 'wezterm'

local mux = wezterm.mux
local current_pane_index = 1

wezterm.on("cycle_panes", function(window, pane)
  local tab = window:active_tab()
  local panes = tab:panes()

  -- find the index of the currently active pane
  for i, p in ipairs(panes) do
    if p:pane_id() == pane:pane_id() then
      current_pane_index = i
      break
    end
  end

  -- move to next pane
  local next_index = current_pane_index % #panes + 1
  local next_pane = panes[next_index]

  window:activate_pane(next_pane)
end)

return {
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" }),
  font_size = 10.0,
  color_scheme = "Monokai (dark) (terminal.sexy)",
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2,
  },
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
