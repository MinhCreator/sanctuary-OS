

-- See https://wiki.hypr.land/Configuring/Monitors/
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@144",
    position = "1920x0",
    scale = 1
})
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1
})

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Set programs that you use

local terminal = "alacritty"
local filemanager = "dolphin"
local menu = "rofi -show drun"


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------
--- AUTOSTART ---
-----------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()
    hl.exec_cmd("mprisence")
    hl.exec_cmd("~/eww/target/release/eww daemon &")
    hl.exec_cmd("sleep 2 && ~/eww/target/release/eww open main &")
    hl.exec_cmd("~/sanctuary-OS/setup_wallpaper.sh")
    hl.exec_cmd("cava")
    hl.exec_cmd("python ~/.config/eww/scripts/audio_visualizer.py")
    hl.exec_cmd("discord")
    hl.exec_cmd("steam")
    hl.exec_cmd("sleep 3 && audacious")
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)

-- Refer to https://wiki.hypr.land/Configuring/Variables/

-- https://wiki.hypr.land/Configuring/Variables/-general
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 1,
        resize_on_border = false,
        allow_tearing = false,
        layout = dwindle,
        --col.active_border = { colors = { "rgba(2f6fdbff)", "rgba(5a8deeff)" }, angle? = 45 },
        --col.inactive_border = "rgba(8C9DB2ff)",
    },

    decoration = {
        rounding = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.95,

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            noise = 0.03,
            ignore_opacity = true,
            new_optimizations = true,
            xray = false,
            popups = true,
            --brightness = 1,
            --contrast = 1
        },
    },
    animations = {
        enabled = true,
    },

    ecosystem = {
        no_update_news = 1,
        no_donation_nag = 1
    },
})


-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


-------------
--- INPUT ---
-------------

hl.config({
    input = {
        kb_layout  = "de,us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
        tablet = {
            left_handed = true,
            output = "HDMI-A-1"
        },
    },
})


-------------------
--- KEYBINDINGS ---
-------------------


-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd(filemanager))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("steam"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
