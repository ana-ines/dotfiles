#!/usr/bin/env bash

# COLOURS
G="\033[0;32m"
R="\033[0;31m"
B="\033[0;34m"
Y="\033[0;33m"

echo -e "$G Updating Submodules"
git submodule update --init --recursive

# Array of filenames to skip, any arguments passed to
# the script will be added here
skip=("README.md", "tools", "backups", "sshconfig", $0, $*)
bckpdir="${PWD}/backups/$(date "+%Y%m%d%H%M%S_backup")"
for name in *; do
  if [[ ! ${skip[*]} =~ $name ]]; then
    target="$HOME/.$name"

    if [ -a $target ]; then
      if [[ ! -d $bckpdir ]]; then
        mkdir -p $bckpdir
      fi
      echo -e "$B [+] Backing up $target to $bckpdir/.$name"
      cp -r $target $bckpdir
      echo -e "$R [-] Removing $target"
      rm $target
    fi

    ln -s "$PWD/$name" "$target"
    echo -e "$G [>] Linked $PWD/$name to $target"
  else
    echo -e "$Y [~] Skipping ${name}"
  fi
done
echo "Gonna install vim plugins, might take a while."
sleep 2
vim +BundleInstall! +BundleClean +qall

echo "All done."
echo "Enjoy the Ride!"




.aliases -> /Users/leandro/dotfiles/aliases
.bash_profile -> /Users/leandro/dotfiles/bash_profile
.bashrc -> /Users/leandro/dotfiles/bashrc
.bin -> /Users/leandro/dotfiles/bin
.gemrc -> /Users/leandro/dotfiles/gemrc
.git_template -> /Users/leandro/dotfiles/git_template
.gitconfig -> /Users/leandro/dotfiles/gitconfig
.gitignore -> /Users/leandro/dotfiles/gitignore
.gitignore_global -> /Users/leandro/dotfiles/gitignore_global
.gitmessage -> /Users/leandro/dotfiles/gitmessage
.gvimrc -> /Users/leandro/dotfiles/gvimrc
.inputrc -> /Users/leandro/dotfiles/inputrc
.notes -> /Users/leandro/dotfiles/notes
.plugins -> /Users/leandro/dotfiles/plugins
.rspec -> /Users/leandro/dotfiles/rspec
.tmux -> /Users/leandro/dotfiles/tmux
.tmux-osx.conf -> /Users/leandro/dotfiles/tmux-osx.conf
.tmux.conf -> /Users/leandro/dotfiles/tmux.conf
.tmuxinator -> /Users/leandro/dotfiles/tmuxinator
.tmuxstart -> /Users/leandro/dotfiles/tmuxstart
.vim -> /Users/leandro/dotfiles/vim
.vimrc -> /Users/leandro/dotfiles/vimrc
.vimrc.bundles -> /Users/leandro/dotfiles/vimrc.bundles
