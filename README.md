# Dotfiles

A modern development environment setup featuring Neovim, WezTerm, and Starship configurations.

## Features

### Neovim Configuration
- LSP support with autocompletion via nvim-cmp
- Treesitter for enhanced syntax highlighting
- Telescope for fuzzy finding
- Git integration with Fugitive and Gitsigns
- Auto-formatting with conform.nvim
- GitHub Copilot integration
- Catppuccin color scheme
- Auto-save after 5 minutes of inactivity

### WezTerm Terminal
- Catppuccin Mocha theme
- JetBrains Mono font
- Split pane shortcuts (CMD+D for vertical, CMD+SHIFT+D for horizontal)
- Pane navigation with CMD+SHIFT+[HJKL]
- Tab renaming functionality
- Semi-transparent background with blur effect

### Starship Prompt
- Custom minimal left prompt
- Catppuccin Latte theme
- Informative right-side status display
- Language version indicators (Go, Rust, Node.js)
- AWS and Kubernetes context awareness
- Git branch information

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/dotfiles.git
```

2. Create symbolic links:
```bash
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```
alternatively use something like:
- [gnu stow](https://www.gnu.org/software/stow/)
- [crab-stow](https://github.com/nicolas-moon/crab-stow)


3. Install plugins:
- Launch Neovim to automatically install plugins via lazy.nvim
- Install Starship: `curl -sS https://starship.rs/install.sh | sh`

## Dependencies

- Neovim (>= 0.9.0)
- WezTerm
- Starship
- Git
- Node.js (for Copilot)
- JetBrains Mono font
