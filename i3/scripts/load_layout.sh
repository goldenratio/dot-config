#!/bin/sh

i3-msg "workspace --no-auto-back-and-forth 1; append_layout ~/.config/i3/workspace_1.json"
i3-msg "workspace --no-auto-back-and-forth 2; append_layout ~/.config/i3/workspace_2.json"

(wezterm &)
(wezterm &)
(wezterm &)
(firefox &)
(brave-browser &)
