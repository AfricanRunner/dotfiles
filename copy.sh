#!/bin/bash

set -eou pipefail

dotfiles=(".hushlogin"
          ".gitconfig"
          ".config/nvim/init.lua"
          ".config/nvim/lua/"
          ".config/zsh/zshrc"
          ".config/zsh/.zshrc"
          ".config/zsh/.p10k.zsh")

trace() {
    echo "$@"
    "$@"
}

copy_safely() {
    from_path=$1
    to_path=$2

    directory=$(dirname $to_path)
    if [ ! -d $directory ]; then
        trace mkdir -p $directory
    fi
    

    if [ -f $from_path ]; then
        trace cp $from_path $to_path
    elif [ -d $from_path ]; then
        trace cp -R $from_path. $to_path
    fi
}

copy_files_into_repo() {
    trace rm -r HOME/
    for dotfile in ${dotfiles[@]}; do
        copy_safely "$HOME/$dotfile" "HOME/$dotfile"
    done
}

copy_files_out_of_repo() {
    for dotfile in ${dotfiles[@]}; do
        copy_safely "HOME/$dotfile" "$HOME/$dotfile"
    done
}

case $1 in
    -i|--in)
        copy_files_into_repo
        ;;
    -o|--out)
        copy_files_out_of_repo
        ;;
    *)
        echo "Unknown option $1"
        ;;
esac
