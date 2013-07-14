# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(osx github sublime)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect for arguments, but enable it for commands.
unsetopt correct_all
setopt correct
# Change to a directory just by typing its name.
setopt autocd
# Use more powerful globbing
setopt extended_glob

function strip_trailing_whitespace() {
	sed -i '' -E "s/[[:space:]]*$//" **/*(.)
}

bindkey '^R' history-incremental-search-backward

export EDITOR='vim'

export PATH=$PATH:/usr/bin/:/usr/local/bin:/Developer/usr/bin:/opt/local/bin:/opt/local/sbin:$HOME/bin:/usr/X11/bin:/Developer/usr/bin:$HOME/pear/bin:/usr/local/sbin:$HOME/.rvm.bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/projects/pebble-dev/arm-cs-tools/bin:$HOME/dev/elasticsearch-0.90.2/bin/:$HOME/dev/redis-2.6.14/src/:

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PERL5LIB="/opt/local/lib/perl5/site_perl/5.12.3/"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# @sindresorhus' Pure prompt
. $ZSH/prompt.zsh

# Import custom profile stuff
# . $HOME/.profile

# Aliases
. $HOME/.aliases
