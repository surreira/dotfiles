export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Terminal History
HISTSIZE=50000
SAVEHIST=$HISTSIZE
setopt append_history        # append
setopt hist_ignore_space     # ignore space prefixed commands
setopt hist_ignore_all_dups  # no duplicate
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks    # trim blanks
setopt hist_verify           # show before executing history commands
setopt inc_append_history    # add commands as they are typed, don't wait until shell exit
setopt share_history         # share hist between sessions

# Set the Zinit directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load Zsh plugins with Zinit
zinit light spaceship-prompt/spaceship-react
zinit light spaceship-prompt/spaceship-prompt
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light paulirish/git-open
zinit light djui/alias-tips

# Add Zinit snippets
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZP::git
zinit snippet OMZP::fnm
zinit snippet OMZP::npm
zinit snippet OMZP::yarn
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 80 30
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'

# Aliases
source $HOME/.aliases

# Shell integrations
source <(fzf --zsh)
source <(fnm env --use-on-cd)

export PATH="$HOME/.local/bin:$PATH"
