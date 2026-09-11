# Sway — Window Manager Guide

Configuration and usage reference for the Sway compositor (Wayland), the heart of this dotfiles setup.

This guide documents **what makes up the desktop**, the **tools it relies on**, and the **keybindings** defined in [`config`](./config).

- Managed via GNU Stow → symlinked to `~/.config/sway/`
- Modifier keys: **`$mod` = `Alt`** (Mod1) and **`$win` = `Super`** (Mod4)

---

## 1. Composition — desktop components

Sway itself is only the compositor/window manager. The desktop is *composed* from these always-running pieces:

| Component | Role | Config in this repo |
|-----------|------|---------------------|
| **Sway** | Compositor & tiling window manager | `sway/config` |
| **Waybar** | Status bar (workspaces, taskbar, clock, system tray) | `waybar/config.jsonc`, `waybar/style.css` |
| **Swaync** | Notification daemon & control center | `swaync/config.json`, `swaync/style.css` |
| **Wofi** | Application launcher (`$mod+d`) & menu driver | `wofi/config`, `wofi/style.css` |
| **Wob** | On-screen volume / brightness overlay (pipe to `$WOBSOCK`) | — |
| **Swayidle** | Idle management (auto lock → screen off) | defined in `sway/config` |
| **Swaylock** | Screen locker | `swaylock -f -c 000000` |
| **Swaynag** | Exit / error dialog | invoked on `$mod+Shift+e` |
| **Fcitx5** | Input method framework (CJK/Chinese input) | `fcitx5/config` |

### Autostarted daemons (from `config`)
- **swaync** — notifications (`exec swaync`)
- **nm-applet** — network manager tray icon
- **blueman-applet** — bluetooth tray icon
- **polkit-gnome** — privilege authorization agent
- **cliphist** — clipboard history store (`wl-paste --watch cliphist store`)
- **swayidle** — lock after 300s idle, power off screen after 600s

---

## 2. Tools — the command-line toolkit

Small CLI utilities the keybindings (and daily use) rely on. All are in `package.list` / installed on this machine.

### Screenshots (the *clipboard-first* workflow)
| Tool | Purpose |
|------|---------|
| **grim** | Wayland screenshot capture |
| **slurp** | Interactive region selection (returns geometry) |
| **wl-clipboard** (`wl-copy` / `wl-paste`) | Wayland clipboard read/write |
| **notify-send** | Desktop notification feedback (via swaync) |

Manual equivalents of the bound shortcuts:

```sh
# Region -> clipboard        (≈ $mod+Shift+s)
slurp > /tmp/.swayshot.geom \
  && grim -g "$(cat /tmp/.swayshot.geom)" - | wl-copy

# Full screen -> clipboard   (≈ Print / $mod+p)
grim - | wl-copy

# Region -> file             (≈ $mod+Shift+p)
mkdir -p ~/Pictures/Screenshots
grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
```

> **Cancelling a region selection** (pressing `Esc` while `slurp` is active) must be a no-op:
> no clipboard change and no notification. The region→clipboard bind writes the geometry to a
> file first and only proceeds when `slurp` exits successfully — a plain `grim ... | wl-copy`
> would hide `grim`'s failure, since `wl-copy` exits `0` even on empty input, wiping the
> clipboard and reporting a false success.

### Clipboard history
| Tool | Purpose |
|------|---------|
| **cliphist** | Persists clipboard history; store & recall |

```sh
# Paste from history picker (≈ $mod+c)
cliphist list | wofi --dmenu | cliphist decode | wl-copy
```

### System control
| Tool | Key(s) | Action |
|------|--------|--------|
| **pactl** (PulseAudio) | `XF86Audio*` keys | Volume / mic mute, feedback via Wob |
| **brightnessctl** | `XF86MonBrightness*` | Screen brightness ±5%, feedback via Wob |
| **playerctl** | — | Media playback control (when used) |

### Input
- **fcitx5** — Chinese/CJK input, started with `fcitx5 -d`

---

## 3. Keybindings

> `$mod` = **Alt** · `$win` = **Super**. H/J/K/L act as arrow keys (vim-style).

### App launcher & basics
| Keys | Action |
|------|--------|
| `$mod+Return` | Launch terminal (`ghostty`) |
| `$mod+d` | Application launcher (`wofi`) |
| `$mod+q` | Kill focused window |
| `$mod+Shift+c` | Reload sway config |
| `$mod+Shift+e` | Exit sway (confirmation via swaynag) |

### Focus & movement (H/J/K/L = arrows)
| Keys | Action |
|------|--------|
| `$mod+{h,j,k,l}` / `$mod+{←,↓,↑,→}` | Focus window in direction |
| `$mod+Shift+{h,j,k,l}` / arrows | Move focused window in direction |
| `$mod+a` | Focus parent container |
| `$mod+space` | Toggle focus: tiling ↔ floating |
| `$mod+Shift+space` | Toggle floating of focused window |

### Workspaces (1–10)
| Keys | Action |
|------|--------|
| `$mod+0..9` | Switch to workspace N |
| `$mod+Shift+0..9` | Move focused window to workspace N |

### Layout & windows
| Keys | Action |
|------|--------|
| `$mod+b` / `$mod+v` | Split horizontal / vertical |
| `$mod+s` | Layout: stacking |
| `$mod+w` | Layout: tabbed |
| `$mod+e` | Layout: toggle split |
| `$mod+f` | Toggle fullscreen |
| `$mod+minus` | Scratchpad: show/hide window |
| `$mod+Shift+minus` | Move window to scratchpad |
| `$mod+r` | Enter **resize mode** (below) |

### Resize mode (after `$mod+r`)
| Keys | Action |
|------|--------|
| `h/j/k/l` or arrows | Shrink/grow focused container (10px) |
| `Return` / `Escape` | Exit resize mode |

### Screenshots 🖼️
| Keys | Action |
|------|--------|
| `$mod+Shift+s` | **Region → clipboard** + notification |
| `Print` | Full screen → clipboard + notification |
| `$mod+p` | Full screen → clipboard + notification |
| `$mod+Shift+p` | Region → save `~/Pictures/Screenshots/` + notification |

### Media, volume & brightness
| Keys | Action |
|------|--------|
| `XF86AudioMute` | Mute/unmute sink |
| `XF86AudioLowerVolume` / `XF86AudioRaiseVolume` | Volume −5% / +5% (Wob feedback) |
| `XF86AudioMicMute` | Mute/unmute mic |
| `XF86MonBrightnessDown` / `XF86MonBrightnessUp` | Brightness −5% / +5% (Wob feedback) |

*(Volume & brightness keys use `--locked`, so they work on the lock screen.)*

### Other
| Keys | Action |
|------|--------|
| `$win+l` | Lock screen (`swaylock`) |
| `$mod+c` | Clipboard history picker |

---

## Layout & appearance notes
- Border 2px, inner gap 4px, outer gap 5px, `smart_gaps on`
- Font: `SourceCodePro` (Pango)
- Focused window color accent: `#8fd4ff`
- Laptop display `eDP-1` scaled at **1.2**
- Selected windows auto-float: telegram, Thunar, Steam, pavucontrol, file dialogs, pop-ups, etc.
