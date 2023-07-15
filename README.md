# dotfiles

![Logo](assets/logo.png)

Hey there! This is my personal collection of macOS and Linux dotfiles that I use to customize my development environments. In this repository, you'll find my configurations for:

- [Zsh](https://www.zsh.org/), with the [Spaceship Prompt](https://spaceship-prompt.sh/) and the [Nord](https://www.nordtheme.com/) theme;
- Custom [NeoVim](https://neovim.io/) PDE setup;
- [Alacritty](https://github.com/alacritty/alacritty) and [tmux](https://github.com/tmux/tmux/);
- Window management and keyboard customizations for [yabai](https://github.com/koekeishiya/yabai) and [skhd](https://github.com/koekeishiya/skhd).

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage these dotfiles, making it easy to install and manage them on multiple machines. To get started, follow these steps:

1. Clone repository: `git clone https://github.com/surreira/dotfiles.git ~/.dotfiles`
1. Change into the directory: `cd ~/.dotfiles`
1. Use Stow to install the separate dotfiles you're interested in, for example:
   - single configuration `stow zsh`
   - or with multiple options: `stow zsh spaceship tmux git neovim`
   - also, setting the target directory with: `stow --target=/path/to/target zsh` 

That's it! All these settings should turn the command line interface into a personalized development environment up and running without hassle.

Feel free to take a look at my dotfiles and use them as inspiration for your own customization.


## Detailed Install Instructions

### tmux

In order to extend tmux functionalities, like using a custom theme, I have [TPM](https://github.com/tmux-plugins/tpm) setup in `tmux.conf`. To install TPM follow the instructions from the project repository, the current install instructions are:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Note: before installing TPM, `stow tmux` first.

### Alacritty 

To add a custom theme to Alacritty terminal I'm using the official [themes repo](https://github.com/alacritty/alacritty-theme) and the current install instructions are:

```bash
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Font requirement:

```bash
brew install font-fira-code-nerd-font
```

Note: before installing the themes, `stow alacritty` first.

### NeoVim

To help with NeoVim customization I'm using [packer.nvim](https://github.com/wbthomason/packer.nvim) plugin manager. To install Packer:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Note: before installing Packer, `stow neovim` first.
