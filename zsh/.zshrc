# Terminal History
export HISTSIZE=50000
export SAVEHIST=10000
setopt append_history        # append
setopt hist_ignore_all_dups  # no duplicate
unsetopt hist_ignore_space   # ignore space prefixed commands
setopt hist_reduce_blanks    # trim blanks
setopt hist_verify           # show before executing history commands
setopt inc_append_history    # add commands as they are typed, don't wait until shell exit
setopt share_history         # share hist between sessions

# zplug
source $HOME/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "spaceship-prompt/spaceship-react"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "paulirish/git-open", as:plugin
zplug "plugins/fnm", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "djui/alias-tips"

if ! zplug check; then
  zplug install
fi

zplug load

# Aliases
source $HOME/.aliases

# fnm
eval "`fnm env`"
