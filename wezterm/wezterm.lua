local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'catppuccin-mocha'
config.macos_window_background_blur = 30
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
    {
        key = "e",
        mods = "CMD|SHIFT",
        action = act.PromptInputLine {
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }
    },
    {
        key = "f",
        mods = "CMD|SHIFT",
        action = wezterm.action_callback(function(window, pane, line)
            local cwd_uri = pane:get_current_working_dir()
            if cwd_uri then
                local cwd = tostring(cwd_uri):match(".*/([^/]+)$") or toastring(cwd_uri)
                window:active_tab():set_title(cwd)
            end
        end),
    },
}
return config
