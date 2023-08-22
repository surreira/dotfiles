PATH=$PATH:$HOME/.local/bin

# Keybindings
bindkey -s ^f "tmux-sessionizer\n"
bindkey '^[^?' backward-kill-word

# Exports
export EDITOR='nvim'
export VISUAL='nvim'

if [[ $OSTYPE = (darwin)* ]]; then
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha

    # Homebrew path
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Spaceship Prompt (https://github.com/spaceship-prompt/spaceship-prompt)
export ZSH_THEME="spaceship"
