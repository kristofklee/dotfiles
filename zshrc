# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="philips"
#export ZSH_THEME="robbyrussell"
#export ZSH_THEME="daveverwer"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby brew gem github osx bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Oracle Instant Client Config
export ORACLE_HOME=/opt/oracle/instantclient_10_2
export TNS_ADMIN=$ORACLE_HOME
export SQLPATH=$ORACLE_HOME
export DYLD_LIBRARY_PATH=$ORACLE_HOME:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH
export PATH=$PATH:$ORACLE_HOME

# Java & Mavens
#export JAVA_HOME=/Library/Java/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
#export M2_HOME=/opt/local/share/java/maven2

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# My bin
export PATH=$HOME/bin:$PATH

# Editor
export EDITOR='mvim -f'

# RVM
unsetopt auto_name_dirs
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#export TERM=rxvt-256color
export TERM=screen-256color

# vim settings
alias tmux="TERM=screen-256color tmux"
alias mc="TERM=xterm-256color mc"
#alias tmux="TERM=xterm-256color tmux"

# node js
export NODE_PATH=/usr/local/lib/node_modules

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


alias sshtisstest="ssh r01 'ssh rtest01-i'"
alias redmine="ruby script/redmine"


# tiss ssh aliases
alias tissdev1="ssh -A r01 -t ssh -A dev2-i -t su - rails"
alias tisstest="ssh -A r01 -t ssh -A rtest01-i -t su - rails"
alias tissmigdev="ssh -A r01 -t ssh -A rmig01-i -t su - rails"
alias tissmigprod="ssh -A r01 -t ssh -A rmig02-i -t su - rails"
