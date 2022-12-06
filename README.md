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

### Tmux configuration

#### Allow scrolling
```tmux
set -g mouse on 
```

#### Fix ESC lag time
```tmux
set -sg escape-time 10
```

#### Get proper colors
```tmux
set-option -sa terminal-overrides ",xterm*:Tc"
```

You can add all of the above in `~/.tmux.conf`, and then sourcing by running in your shell:
```shell
tmux source-file ~/.tmux.conf
```
