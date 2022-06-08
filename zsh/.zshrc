HISTCONTROL="ignoredups"
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $HOME/.aliases

source $HOME/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

if ! zplug check; then
    zplug install
fi

zplug load

SPACESHIP_TIME_SHOW=true
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_CHAR_PREFIX="💻 🔨"

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"
