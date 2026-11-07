-- nodaysidle Kiln — Hyprland Configuration (Lua)
-- Warm fired-clay cockpit. Static ember rail, no border animation, no blur.

local active_border_color = {
  colors = {
    "rgba(E8703AFF)", -- forge mouth
    "rgba(C9562AFF)", -- cooling ember
    "rgba(6A2E18FF)", -- burnt umber
    "rgba(2A1A12FF)", -- clay shadow
    "rgba(100C0AFF)", -- kiln void
  },
  angle = 0,
}

local inactive_border_color = {
  colors = {
    "rgba(100C0AFF)",
    "rgba(3A2C24AA)", -- clay hairline
    "rgba(100C0AFF)",
  },
  angle = 0,
}

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    gaps_in = 6,
    gaps_out = { top = 2, right = 12, bottom = 12, left = 12 },
    border_size = 3,
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
      border_locked_active = active_border_color,
      border_locked_inactive = inactive_border_color,
    },
    groupbar = {
      col = {
        active = "rgba(E8703A55)",
        inactive = "rgba(100C0AEE)",
      },
      text_color = "rgb(F5CE6B)",
      text_color_inactive = "rgba(107, 91, 78, 0.80)",
      blur = false,
      gradient_rounding = 6,
    },
  },

  decoration = {
    rounding = 12,
    rounding_power = 2.6, -- clay bends before it cracks

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    dim_inactive = true,
    dim_strength = 0.18,
    dim_special = 0.30,

    blur = {
      enabled = false, -- warm haze + blur = mud, and it costs iGPU frames
    },

    shadow = {
      enabled = true,
      range = 16,
      render_power = 2,
      color = "rgba(0A0503AA)",
      color_inactive = "rgba(0A050366)",
    },
  },
})

hl.curve("kilnSettle", { type = "bezier", points = { { 0.22, 1.0 }, { 0.28, 1.0 } } })
hl.curve("kilnDismiss", { type = "bezier", points = { { 0.40, 0.0 }, { 1.0, 1.0 } } })

-- No borderangle animation: the rail is static heat, not a marquee.
hl.animation({ leaf = "borderangle", enabled = false })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 5.0, bezier = "kilnSettle", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "kilnDismiss", style = "slide" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.0, bezier = "kilnSettle", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.0, bezier = "kilnDismiss", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.0, bezier = "kilnSettle", style = "slide" })

o.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "1.0 1.0" })
o.window({ tag = "default-opacity" }, { opacity = "1.0 1.0" })
o.window({ class = "com.mitchellh.ghostty" }, { opacity = "1.0 1.0" })
o.window({ title = "^Herdr.*" }, { opacity = "1.0 1.0" })
o.window({ tag = "chromium-based-browser" }, { opacity = "1.0 1.0" })
o.window({ tag = "firefox-based-browser" }, { opacity = "1.0 1.0" })

hl.layer_rule({ match = { namespace = "^(omarchy-notifications|omarchy-osd|omarchy-reminders)$" }, blur = false })
