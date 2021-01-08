# tools

Welcome to the tools repository.

### Setting-up VIM quickly on a new machine:

```shell
cd ~
git clone git@github.com:acordier16/tools.git
cp tools/.vimrc ~
cp -r tools/.vim ~
mkdir ~/.vim/bundle/
git clone git@github.com:prettier/vim-prettier.git ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
~/.vim/black/bin/pip install black
```

### Setting-up iTerm

Copy ```com.googlecode.iterm2.plist``` where needed.

### Setting-up git

Need to upload .git/config, and tmux conf if I have one.

### Running autossh in the background

```shell
autossh -M 0 -f -T -N machine1 & autossh -M 0 -f -T -N machine2 &
````

### Allow scrolling in tmux

```tmux
set -g mouse on 
```
