#!/bin/sh

set -e

dotfiles=(".hushlogin"
          ".config/nvim/init.lua"
          ".config/nvim/lua")

working_directory=$(pwd)

create_folder() {
    directory=$(dirname $1)
    if [ ! -d $directory ]; then
        echo "mkdir -p ${directory}"
        mkdir -p $directory
    fi
}

for dotfile in ${dotfiles[@]}; do
    if [ -L ~/$dotfile ]; then
        continue
    elif [ -d ~/$dotfile ]; then
        create_folder $working_directory/HOME/$dotfile
        echo "mv ~/${dotfile} ${working_directory}/HOME/${dotfile}"
        mv ~/$dotfile $working_directory/HOME/$dotfile
    elif [ -f ~/$dotfile ]; then
        create_folder $working_directory/HOME/$dotfile
        echo "cp ~/${dotfile} ${working_directory}/HOME/${dotfile}"
        cp ~/$dotfile $working_directory/HOME/$dotfile
    else
        create_folder ~/$dotfile
    fi
    directory=$(dirname $dotfile)
    echo "ln ${working_directory}/HOME/${dotfile} ~/${directory}"
    ln -sfF $working_directory/HOME/$dotfile ~/$directory
done
