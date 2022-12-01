# tools

Welcome to the tools repository.

### Setting-up VIM quickly on a new machine:

```shell
cd ~
git clone git@github.com:acordier16/tools.git
cp tools/.vimrc ~
cp -r tools/.vim ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
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
