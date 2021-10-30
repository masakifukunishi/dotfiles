## iterm2

https://iterm2.com/downloads.html

## brew

https://brew.sh/

## zsh

```
brew install zsh
```

```
vim ~/.zshrc
```

## screen

```
brew install screen
```

## tmux

```
brew install tmux
```

```
vim ~/.tmux.conf
```

## neovim

```
brew install neovim
```

```
vim ~/.config/nvim/init.vim
```

## vim plug

https://github.com/junegunn/vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## NERRTree

## FZF

```
brew install fzf
```

## vim-fugitive

https://github.com/tpope/vim-fugitive

```
mkdir -p ~/.config/nvim/pack/tpope/start
cd ~/.config/nvim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q
```

## vim-gitgutter

https://github.com/airblade/vim-gitgutter

```
mkdir -p ~/.config/nvim/pack/airblade/start
cd ~/.config/nvim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
nvim -u NONE -c "helptags vim-gitgutter/doc" -c q

```

## vim-commentary

https://github.com/tpope/vim-commentary

```sh
mkdir -p ~/.config/nvim/pack/tpope/start
cd ~/.config/nvim/pack/tpope/start
git clone https://tpope.io/vim/commentary.git
vim -u NONE -c "helptags commentary/doc" -c q
```

## coc-nvm

```
brew install curl
brew install nvm
```

```ini:.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
```

```
pip3 install pylint jedi
```

```
:CocInstall coc-python
```

## oh my zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cat ~/.zshrc.pre-oh-my-zsh >> ~/.zshrc
```
