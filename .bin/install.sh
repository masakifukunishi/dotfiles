#!/usr/bin/env zsh
dir=`dirname $0`
. ${dir}/vars.sh

## Check if command exists
function existsCmd () {
  type -a $1 > /dev/null 2>&1
}
INFO_COLOR="${ESC}[${GREEN}%s${ESC}[m\n"

COMMANDS=('nodebrew' 'git' 'zsh' 'tmux' 'neovim' 'fzf' 'curl' 'nvm')

## brew
if ! existsCmd brew;
then
  command printf "${INFO_COLOR}" "[info][brew] does not exist"
  command printf "${INFO_COLOR}" "[info][brew] install it..."
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  command printf "${INFO_COLOR}" "[info][brew] already exists"
  command printf "${INFO_COLOR}" "[info][brew] updating brew..."
  command brew update
fi

for v in "${COMMANDS[@]}"
do
  if ! existsCmd $v;
  then
    command printf "${INFO_COLOR}" "[info][$v] does not exist"
    command printf "${INFO_COLOR}" "[info][$v] installing it..."
    command brew install $v
  else
    command printf "${INFO_COLOR}" "[info][$v] already exists"
  fi
done

## vim plug (Vim plugin manager)
vim_plug_path="${XDG_DATA_HOME:-$HOME}/.local/share/nvim/site/autoload/plug.vim"
if [ ! -e $vim_plug_path ]; 
then
  command /bin/bash -c "$(curl -fLo "${vim_plug_path}" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"
  command printf "${INFO_COLOR}" "[info][vimplug] does not exist"
  command printf "${INFO_COLOR}" "[info][vimplug] installing it..."
else
  command printf "${INFO_COLOR}" "[info][vimplug] already exists"
fi

## vim plugins
# make directory 
tpope_path="${HOME}/.config/nvim/pack/tpope/start"
if [ ! -e $tpope_path ];
then
  command printf "${INFO_COLOR}" "[info][tpope_path] does not exist"
  command mkdir -p $tpope_path
  command printf "${INFO_COLOR}" "[info][tpope_path] created"
else
  command printf "${INFO_COLOR}" "[info][tpope_path] already exists"
fi

airblade_path="${HOME}/.config/nvim/pack/airblade/start"
if [ ! -e $airblade_path ];
then
  command printf "${INFO_COLOR}" "[info][airblade_path] does not exist"
  command mkdir -p $airblade_path
  command printf "${INFO_COLOR}" "[info][airblade_path] created"
else
  command printf "${INFO_COLOR}" "[info][airblade_path] already exists"
fi

# fugitive
figitive_path="${tpope_path}/fugitive"
if [ ! -e $figitive_path ];
then
  command printf "${INFO_COLOR}" "[info][fugitive] does not exist"
  command printf "${INFO_COLOR}" "[info][fugitive] install it..."
  command cd $tpope_path
  command git clone https://tpope.io/vim/fugitive.git
  command vim -u NONE -c "helptags fugitive/doc" -c q
else
  command printf "${INFO_COLOR}" "[info][fugitive] already exists"
fi

# commentary
commentary_path="${tpope_path}/commentary"
if [ ! -e $figitive_path ];
then
  command printf "${INFO_COLOR}" "[info][commentary] does not exist"
  command printf "${INFO_COLOR}" "[info][commentary] install it..."
  command cd $tpope_path
  command git clone https://tpope.io/vim/commentary.git
  command vim -u NONE -c "helptags commentary/doc" -c q
else
  command printf "${INFO_COLOR}" "[info][commentary] already exists"
fi

# vim-gitgutter
gitgutter_path="${airblade_path}/vim-gitgutter"
if [ ! -e $figitive_path ];
then
  command printf "${INFO_COLOR}" "[info][vim-gitgutter] does not exist"
  command printf "${INFO_COLOR}" "[info][vim-gitgutter] install it..."
  command cd $airblade_path
  command git clone https://github.com/airblade/vim-gitgutter.git
  command nvim -u NONE -c "helptags vim-gitgutter/doc" -c q
else
  command printf "${INFO_COLOR}" "[info][vim-gitgutter] already exists"
fi

# oh my zsh
if [ ! -e ~/.oh-my-zsh ];
then
  command /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  command cat ~/.zshrc.pre-oh-my-zsh >> ~/.zshrc
else
  command printf "${INFO_COLOR}" "[info][oh-my-zsh] already exists"
fi

## files
# tmux
command printf "${INFO_COLOR}" "[info][tmux] deploy .tmux.conf"
command cp ./files/.tmux.conf ~/

# neovim
command printf "${INFO_COLOR}" "[info][neovim] deploy init.vim"
command cp ./files/init.vim ~/.config/nvim/init.vim

#zsh
command printf "${INFO_COLOR}" "[info][zshrc] deploy .zshrc"
command cat ~/.zshrc.pre-oh-my-zsh >> ~/.zshrc
command cat ./files/.zshrc >>  ~/.zshrc