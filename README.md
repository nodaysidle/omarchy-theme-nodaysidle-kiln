# nodaysidle Kiln (`nodaysidle-kiln`)

> A fired-clay dark Omarchy theme that reads like a lit forge instead of a server rack.

Every theme in the workspace lives in the cold half of the spectrum — Aura is cobalt, Carbon Noir is platinum, Royal Green and Red are jewel tones. **Kiln** fills that void with a grounded, warm aesthetic: glowing embers, raw clay, sulphur warnings, and bone typography.

---

## Palette

| Token | Hex | Role |
| :--- | :--- | :--- |
| **Kiln Void** | `#100C0A` | Primary background (black with actual red-brown) |
| **Kiln Soot** | `#080605` | Popovers, lock, sunken surfaces |
| **Kiln Raise** | `#1A1411` | Cards, tabs, elevated surfaces |
| **Clay Hairline** | `#3A2C24` | Inactive borders, subtle dividers |
| **Ember** | `#E8703A` | Primary accent, forge mouth, cursor |
| **Sulphur** | `#E9B44C` | Warning, secondary highlight |
| **Olive Signal** | `#8FA65B` | Success, connected, git additions |
| **Brick** | `#D64545` | Error, destructive |
| **Bone** | `#EDE3D6` | Primary text (no cold white clash) |
| **Ash** | `#6B5B4E` | Muted labels, comments, secondary text |
| **Desaturated Blue** | `#6E8598` | Cool ANSI accent (restrained) |
| **Desaturated Cyan** | `#7FA89A` | Cool ANSI telemetry (restrained) |

---

## Design System

### 1. The Forge Mouth (Active Border)
* **Active Border:** 3px horizontal gradient (0°) spanning `ember (#E8703A) → cooling ember (#C9562A) → burnt umber (#6A2E18) → clay shadow (#2A1A12) → kiln void (#100C0A)`.
  As Hyprland paints across the window box, the focused window reads as a warm rail falling off into soot.
* **Inactive Border:** Static clay hairline `rgba(3A2C24AA)`.
* **Zero Redraw Overhead:** Border angle animation (`borderangle`) is explicitly disabled — focused windows remain a still photograph of heat, preserving Arc iGPU frames.

### 2. Geometry & Tone
* **Curvature:** `rounding = 12` with `rounding_power = 2.6` — softer than the 10/4.0 squircle in Aura; clay bends before it cracks.
* **Asymmetric Gap Rhythm:** `gaps_in = 6`, `gaps_out = { top = 2, right = 12, bottom = 12, left = 12 }` so the bar sits tight against the screen edge like a kiln lintel.
* **Depth Without Mud:** Inactive windows dim by `0.18` with a warm-tinted shadow (`rgba(0A0503AA)`, range 16). Surface blur stays disabled to avoid warm mud and save iGPU fill-rate.

### 3. Analogue Bar & Surfaces
* **Lintel Bar:** 30px height, 1px `#2A1F19` bottom border, `#0C0908` background at 0.94 alpha.
* **Indicators:** Workspace indicators use thin ember ticks (`style = "ticks"`) rather than pills.
* **Center Clock:** Tabular monospace date/time (`%a %d %b  %H:%M`).

### 4. Heavy Motion
* **Motion Curve:** `kilnSettle` `(0.22, 1.0, 0.28, 1.0)` and `kilnDismiss` `(0.40, 0.0, 1.0, 1.0)`. Slow and heavy: windows settle into place rather than snap.

---

## Installation & Activation

```bash
# Install and link theme
cd ~/dev/nodaysidle/omarchy-theme-nodaysidle-kiln
./install

# Activate
omarchy theme set nodaysidle-kiln
```
