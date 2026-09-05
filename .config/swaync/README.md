# Swaync — Notification Daemon

Notification daemon and control center for the Sway desktop (autostarted with `exec swaync` in the sway config).

- Managed via GNU Stow → symlinked to `~/.config/swaync/`
- Settings: [`config.json`](./config.json)
- Styling: [`style.css`](./style.css) — **Catppuccin Macchiato** theme

## Behavior settings (`config.json`)
| Setting | Value | Meaning |
|---------|-------|---------|
| Position | right / top, `overlay` layer | Notifications appear top-right |
| `notification-window-width` | 400 | Max width of a popup |
| `control-center-width` / `height` | 500 × 600 | Control-center size |
| `timeout` | 8 s (low 5 s, critical ∞) | Auto-dismiss timing |
| `image-visibility` | `when-available` | Show a preview when an image is attached |
| `hide-on-action` | true | Dismiss after clicking an action |
| `keyboard-shortcuts` | true | `Escape` closes the popup |

## Interacting
- **Popup** appears top-right on events (e.g. `notify-send`).
- **Control center** (history / "Do Not Disturb" toggle) is opened from Waybar's tray icon.
- Uses layers-shell (`layer-shell: true`) so it floats above windows.

## Styling (`style.css`)
Catppuccin Macchiato palette (`@base`, `@mantle`, `@surface*`, `@text`, `@blue`, …):

| Element | Look |
|---------|------|
| Notification card | `@base` bg, 12px radius, subtle shadow |
| Summary | bold 16px `@text` |
| Body | 15px `@subtext0` |
| Icons | tinted `@blue` (48px) |
| Control center | translucent `@mantle`, 16px radius |
| Close button | `@red` circle |
| Do-Not-Disturb active | `@mauve` |

Screenshot notifications (from the sway bindings) use `notify-send -a Screenshot -i camera-photo-symbolic` so they pick up the themed icon slot here.
