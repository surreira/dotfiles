# dotfiles

![Logo](assets/logo.png)

Hey there! This is my personal collection of macOS and Linux dotfiles that I use to customize my development environments. In this repository, you'll find my configurations for:

- [Zsh](https://www.zsh.org/), with the [Spaceship Prompt](https://spaceship-prompt.sh/);
- Aliases for the terminal;
- [Alacritty](https://github.com/alacritty/alacritty) and [Tmux](https://github.com/tmux/tmux/);
- [Git](https://git-scm.com/), [NeoVim](https://github.com/neovim/neovim), and window management customizations for [Yabai](https://github.com/koekeishiya/yabai) and [SKHD](https://github.com/koekeishiya/skhd).

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage these dotfiles, making it easy to install and manage them on multiple machines. To get started, follow these steps:

1. Clone repository: `git clone https://github.com/surreira/dotfiles.git ~/.dotfiles`
1. Change into the directory: `cd ~/.dotfiles`
1. Use Stow to install the separate dotfiles you're interested in, for example:
   - single configuration `stow zsh`
   - or with multiple options: `stow zsh spaceship tmux git neovim`
   - also, setting the target directory with: `stow --target=/path/to/target skdh yabai` 

That's it! All these settings should turn your command line interface into a personalized development environment up and running without any hassle.

Feel free to take a look at my dotfiles and use them as inspiration for your own customization.

