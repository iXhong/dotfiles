# Waybar — Status Bar

Configures the status bar rendered on top of Sway (launched via `swaybar_command waybar` in the sway config).

- Managed via GNU Stow → symlinked to `~/.config/waybar/`
- Bar config: [`config.jsonc`](./config.jsonc)
- Styling: [`style.css`](./style.css)

## Modules

| Position  | Modules |
|-----------|---------|
| **Left**  | `sway/workspaces`, `wlr/taskbar` |
| **Center**| `sway/window` |
| **Right** | `custom/theme`, `clock`, `pulseaudio`, `cpu`, `memory`, `battery`, `network`, `tray` |

## Feature highlights

### GTK theme switcher (`custom/theme`)
Click the **☀** module to open a menu (**Light / Dark**) that toggles the GTK theme via `gsettings`:

- `menu/theme_menu.xml` — GTK menu definition
- `scripts/light.sh` — `notify-send "Light Now"` + set `gtk-theme` to `Adwaita`
- `scripts/dark.sh` — `notify-send "Dark Now"` + set `gtk-theme` to `Adwaita-dark`

### Other right-side modules
- **pulseaudio** — volume %, source mute indicator
- **network** — live ↓/↑ bandwidth bytes (3s interval)
- **clock** — `%a|%b-%d|%H:%M`
- **battery** — %, with warning at 30% / critical at 15%
- **cpu / memory / tray**

## Styling notes
- Icons use **Symbols Nerd Font** (needs the Nerd Font installed)
- Border/bar colors follow the Catppuccin palette (see `style.css`)
