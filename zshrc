# Add Homebrew to the PATH
export PATH=./node_modules/.bin:/usr/local/bin:/usr/local/sbin:$PATH

# Global Exports
export HOMEBREW_EDITOR=atom
export EDITOR=atom

# Don't rename titles automatically, looks weird in Tmux.
DISABLE_AUTO_TITLE="true"

# Color Theme
ZSH_THEME="theunraveler"

# ZSH Plugins
plugins=(
  git
  rails
  web-search
)

# Path to our oh-my-zsh installation.
[[ -s "$HOME/.oh-my-zsh" ]] && export ZSH="$HOME/.oh-my-zsh"

# Setup Oh My ZSH
if [[ -s "$ZSH/oh-my-zsh.sh" ]]; then
  source $ZSH/oh-my-zsh.sh

  if [[ -s "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
fi

if [[ -s "$HOME/.config/pythonstartup" ]]; then
  export PYTHONSTARTUP="$HOME/.config/pythonstartup"
fi

# GVM Settings
if [[ -s "$HOME/.gvm/scripts/gvm" ]]; then
  source "$HOME/.gvm/scripts/gvm"
  export PATH=$GOPATH/bin:$PATH
fi

# NVM Settings
export NVM_DIR="$HOME/.nvm"

if [[ -s "$(brew --prefix nvm)/nvm.sh" ]]; then
  source "$(brew --prefix nvm)/nvm.sh"
  #source "$NVM_DIR/nvm.sh"
fi

# See: https://github.com/jsdf/nvm_auto
if [[ -s "$HOME/.nvm/nvm_auto.sh" ]]; then
  source $HOME/.nvm/nvm_auto.sh
fi

# Additional environment configs can go here...
if [[ -s "$HOME/.extra.env.sh" ]]; then
  source $HOME/.extra.env.sh
fi

# RVM Settings
#if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
#  source "$HOME/.rvm/scripts/rvm"
#  export PATH="$HOME/.rvm/bin:$PATH"
#fi
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# Useful functions
function upgrade {
  echo "Upgrading MacOS"
  sudo softwareupdate -ia

  echo "Upgrading Homebrew"
  brew update
  brew upgrade

  echo "Cleaning up Homebrew"
  brew cleanup

  echo "Checking Homebrew"
  brew doctor
}

# Move file or folder to MacOS's trash
function trash {
  mv $1 $HOME/.Trash/
}

# Aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vim='nvim'
alias rake='noglob rake'
alias htop='sudo htop'
alias ws="cd $WORKSPACE_DIR"
alias dl="cd $HOME/Downloads"
alias ss="cd $STORAGE_DIR"

alias ls='ls -Glh'
alias lt='tree -C'
