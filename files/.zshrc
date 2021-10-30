# coc-nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gch='git checkout'
alias gchb='git checkout -b'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias nrd='npm run dev'
alias nrw='npm run watch'

setopt no_beep
setopt auto_cd #change directory without cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history #Instantly save history

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000