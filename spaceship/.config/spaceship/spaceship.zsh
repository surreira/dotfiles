#!/bin/zsh

spaceship remove docker
spaceship remove docker_compose
spaceship remove react
spaceship remove package
spaceship remove node
spaceship remove python
spaceship remove venv
spaceship remove async
spaceship remove battery

spaceship add docker_compose --order rprompt
spaceship add react --order rprompt
spaceship add node --order rprompt
spaceship add python --order rprompt
spaceship add venv --order rprompt
spaceship add battery --order rprompt
spaceship add async --order rprompt

# Sections customization
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_DIR_TRUNC=0
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
SPACESHIP_PYTHON_PREFIX=""
SPACESHIP_VENV_PREFIX=""
