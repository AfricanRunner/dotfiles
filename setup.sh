#!/bin/sh

set -e

dotfiles=(".hushlogin"
          ".config/nvim/init.lua"
          ".config/nvim/lua/")

working_directory=$(pwd)

copy_safely() {
    from_path=$1
    to_path=$2

    directory=$(dirname $to_path)
    if [ ! -d $directory ]; then
        echo "mkdir -p ${directory}"
        mkdir -p $directory
    fi
    

    if [ -f $from_path ]; then
        echo "cp ${from_path} ${to_path}"
        cp $from_path $to_path
    elif [ -d $from_path ]; then
        echo "cp -r ${from_path} ${to_path}"
        cp -r $from_path $to_path
    fi
}

copy_files_into_repo() {
    for dotfile in ${dotfiles[@]}; do
        echo $dotfile
        copy_safely ~/$dotfile $working_directory/HOME/$dotfile
    done
}

copy_files_out_of_repo() {
    for dotfile in ${dotfiles[@]}; do
        copy_safely $working_directory/HOME/$dotfile ~/$dotfile
    done
}

case $1 in
    -i|--copy-in)
        copy_files_into_repo
        ;;
    -o|--copy-out)
        copy_files_out_of_repo
        ;;
    *)
        echo "Unknown option $1"
        ;;
esac
