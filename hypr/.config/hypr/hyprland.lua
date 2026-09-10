------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "DP-3",
    mode = "2560x1440@164.84",
    position = "2560x0",
    scale = "1",
})
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@164.92",
    position = "auto",
    scale = "auto",
    transform = 3,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local browser = "firefox"
local fileManager = "env GDK_BACKEND=x11 pcmanfm"
local menu = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("nextcloud")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)", }, angle = 45, },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 0.95,
        inactive_opacity = 0.95,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        force_split = 2,
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,  -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
    },

    ---------------
    ---- INPUT ----
    ---------------

    input = {
        kb_layout = "eu",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        numlock_by_default = true,
    },
    cursor = {
        inactive_timeout = 5,
    },
})

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1, }, { 0.32, 1, }, }, })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05, }, { 0.36, 1, }, }, })
hl.curve("linear", { type = "bezier", points = { { 0, 0, }, { 1, 1, }, }, })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5, }, { 0.75, 1, }, }, })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0, }, { 0.1, 1, }, }, })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644, })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default", })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint", })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy", })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%", })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%", })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear", })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear", })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick", })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint", })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade", })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade", })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear", })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear", })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade", })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade", })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade", })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick", })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("emacsclient -c -a emacs"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots -f screenshot-$(date +%s).png"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle", }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ action = "toggle", }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left", }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right", }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up", }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down", }))
-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = "name:Browser", }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = "name:Terminal", }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = "3", }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = "name:Obsidian", }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = "5", }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = "name:KeepassXC", }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = "7", }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = "name:Thunderbird", }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = "name:Spotify", }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "name:SecondScreen", }))
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "name:Browser", }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "name:Terminal", }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3", }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "name:Obsidian", }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5", }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "name:KeepassXC", }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7", }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "name:Thunderbird", }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "name:Spotify", }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "name:SecondScreen", }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1", }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1", }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, })
-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true, })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true, })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true, })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true, })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true, })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.workspace_rule({ workspace = "name:Browser", monitor = "DP-3", on_created_empty = browser, })
hl.workspace_rule({ workspace = "name:Terminal", monitor = "DP-3", default = true, on_created_empty = terminal, })
hl.workspace_rule({ workspace = "3", monitor = "DP-3", })
hl.workspace_rule({ workspace = "name:Obsidian", monitor = "DP-3", on_created_empty = "obsidian", })
hl.workspace_rule({ workspace = "5", monitor = "DP-3", })
hl.workspace_rule({ workspace = "name:KeepassXC", monitor = "DP-3", on_created_empty = "keepassxc", })
hl.workspace_rule({ workspace = "7", monitor = "DP-3", })
hl.workspace_rule({ workspace = "name:Thunderbird", monitor = "DP-3", on_created_empty = "thunderbird", })
hl.workspace_rule({ workspace = "name:Spotify", monitor = "DP-3", on_created_empty = "spotify-launcher", })
hl.workspace_rule({ workspace = "name:SecondScreen", monitor = "DP-2", default = true, on_created_empty = browser, })
-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name = "windowrule-1",
    suppress_event = "maximize",
    match = {
        class = ".*",
    },
})
-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "windowrule-2",
    no_focus = true,
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
})
