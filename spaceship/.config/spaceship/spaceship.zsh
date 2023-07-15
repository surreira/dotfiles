#!/bin/zsh

SPACESHIP_TIME_SHOW=true
SPACESHIP_CHAR_SYMBOL="❯ "
if [[ $OSTYPE = (linux)* ]]; then
	SPACESHIP_CHAR_PREFIX="∫ "
elif [[ $OSTYPE = (darwin)* ]]; then
	SPACESHIP_CHAR_PREFIX="λ "
fi

spaceship remove docker
spaceship remove docker_compose
spaceship remove react
spaceship remove package
spaceship remove node
spaceship remove async
spaceship add docker --order rprompt
spaceship add docker_compose --order rprompt
spaceship add react --order rprompt
spaceship add package --order rprompt
spaceship add node --order rprompt
spaceship add async --order rprompt
