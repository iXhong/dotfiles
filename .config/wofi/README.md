# Wofi — Application Launcher & Menu

Fast Wayland-native launcher used as the Sway app launcher and general picker menu.

- Managed via GNU Stow → symlinked to `~/.config/wofi/`
- Launcher config: [`config`](./config)
- Styling: [`style.css`](./style.css)

## Where it's used in Sway
- **App launcher**: `$mod+d` runs `$menu` = `wofi` (drun mode → desktop apps)
- **Clipboard picker**: `$mod+c` runs `cliphist list | wofi --dmenu | cliphist decode | wl-copy`

## Launcher config (`config`)
| Setting | Value | Effect |
|---------|-------|--------|
| `mode` | `drun` | Show installed desktop applications |
| `allow_images` | true | Render app icons |
| `lines` | 8 | Rows shown before scrolling |
| `width` | 40% | Popup width |

## Styling (`style.css`)
Follows the Catppuccin Macchiato palette for consistency with waybar/swaync.
