## My dotfiles for my Arch Linux

### Introduction

I use **GNU Stow** to manage my dotfiles;
These dotfiles live in `~/dotfiles`.

The repo mirrors my `~/.config` (symlinked via Stow) alongside shell dotfiles (`.zshrc`, `.bashrc`, `.gitconfig`, `.env`, `.condarc`) and an install manifest (`package.list`).

### Guides

Config files come with their own usage docs — check the ones you use:

- **[Sway window manager](.config/sway/README.md)** — desktop composition, tools (grim/slurp/wl-clipboard, cliphist, …), and full keybinding reference.
- **[Waybar status bar](.config/waybar/README.md)** — bar modules, GTK theme switcher, styling.
- **[Swaync notifications](.config/swaync/README.md)** — notification daemon settings, control center, Catppuccin theme.
- **[Wofi launcher](.config/wofi/README.md)** — app launcher & picker menu (`$mod+d`, clipboard picker).
