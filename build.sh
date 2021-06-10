#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

cd $build_dir

for f in pluginrc.zsh
do
    cp $CDIR/$f $build_dir/
done

vim_home=$build_dir/.vim

rm -rf $vim_home
mkdir -p $vim_home
mkdir -p $vim_home/bundle

cd $vim_home

[ $QUIET ] && arg_q='-q' || arg_q=''
[ $QUIET ] && arg_s='-s' || arg_s=''
[ $QUIET ] && arg_progress='' || arg_progress='--show-progress'

if [ -x "$(command -v git)" ]; then
  git clone $arg_q --depth 1 https://github.com/VundleVim/Vundle.vim.git $vim_home/bundle/Vundle.vim 
else
  echo Install git
  exit 1
fi
