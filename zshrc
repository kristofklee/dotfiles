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
export ORACLE_HOME=$HOME/Applications/instantclient_11_2
export TNS_ADMIN=$ORACLE_HOME
export SQLPATH=$ORACLE_HOME
#export DYLD_LIBRARY_PATH=$ORACLE_HOME:$DYLD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH
#export PATH=$PATH:$ORACLE_HOME

# Java & Mavens
#export JAVA_HOME=/Library/Java/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
#export M2_HOME=/opt/local/share/java/maven2

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# My bin
export PATH=$HOME/bin:$PATH

# Vagrant
export PATH=/opt/vagrant/bin:$PATH

# Editor
export EDITOR='mvim -f'

# RVM
unsetopt auto_name_dirs
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#export TERM=rxvt-256color
export TERM=screen-256color

# vim settings
alias tmux="TERM=screen-256color tmux"
alias mc="TERM=xterm-256color mc"
#alias tmux="TERM=xterm-256color tmux"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias sshtisstest="ssh r01 'ssh rtest01-i'"
alias redmine="ruby script/redmine"

# haskell & cabal
export PATH=$PATH:$HOME/.cabal/bin

# node
#export NODE_PATH=/usr/local/lib/node_modules
export PATH="/usr/local/opt/node@6/bin:$PATH"

#export DBEG_SALES_DATABASENAME=sales_kklee

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_12_HOME=$(/usr/libexec/java_home -v12)
export JAVA_13_HOME=$(/usr/libexec/java_home -v13)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java12='export JAVA_HOME=$JAVA_12_HOME'
alias java13='export JAVA_HOME=$JAVA_13_HOME'

java8

