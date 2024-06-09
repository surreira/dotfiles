export LANG=en_US.UTF-8

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

zinit cdreplay -q

# Aliases
source $HOME/.aliases

# fnm
eval "$(fnm env --use-on-cd)"
