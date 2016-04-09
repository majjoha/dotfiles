# Use vim as default editor
export EDITOR="vim"
export VISUAL="vim"

# Enabling coloring in the command line prompt
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:~/.env/bin:/usr/local/share/npm/bin:$PATH
export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Install Homebrew Cask applications in /Applications folder.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="utf-8"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.npm:$PATH"
export PATH="$HOME/.nvm/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

## Docker host
export DOCKER_HOST=tcp://192.168.42.45:2375
export MYSQL_URL="mysql://admin:123456@192.168.42.45:3306/zendesk_development"
export MYSQL_HOST='192.168.42.45'
export MYSQL_USERNAME='admin'
export MYSQL_PASSWORD='123456'
export ZENDESK_PORT=""
export ZENDESK_HOST="zd-dev.com"
export MYSQL_ACCOUNT_TEST=zendesk_test
export MYSQL_SHARD_1_TEST=zendesk_shard_1_test
export MYSQL_ID_SERVER_TEST=zendesk_test

export FZF_DEFAULT_COMMAND='ag -l -g ""'
