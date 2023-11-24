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

# pyenv settings (https://github.com/pyenv/pyenv)
if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# PostgreSQL (installed via homebrew)
PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
