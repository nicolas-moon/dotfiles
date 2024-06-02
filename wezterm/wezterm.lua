local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'catppuccin-frappe'
-- config.macos_window_background_blur = .9
config.window_background_opacity = 0.91
config.font = wezterm.font('JetBrains Mono')

config.keys = {
    {
        key = 'd',
        mods = 'CMD',
        action = act.SplitVertical,
    },
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = act.SplitHorizontal,
    },
    {
        key = 'h',
        mods = 'CMD|SHIFT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'CMD|SHIFT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'CMD|SHIFT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'CMD|SHIFT',
        action = act.ActivatePaneDirection 'Down',
    },
}
return config
