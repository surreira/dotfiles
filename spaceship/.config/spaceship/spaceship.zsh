#!/bin/zsh

spaceship remove docker
spaceship remove docker_compose
spaceship remove react
spaceship remove package
spaceship remove node
spaceship remove async
spaceship remove battery

spaceship add docker_compose --order rprompt
spaceship add react --order rprompt
spaceship add package --order rprompt
spaceship add node --order rprompt
spaceship add async --order rprompt
spaceship add battery --order rprompt

# Sections customization
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_GIT_BRANCH_ASYNC=true
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_COLOR="gray"
SPACESHIP_GIT_PREFIX=""
SPACESHIP_EXEC_TIME_PREFIX=""
SPACESHIP_NODE_PREFIX=""
SPACESHIP_REACT_PREFIX=""
SPACESHIP_DOCKER_COMPOSE_PREFIX=""
