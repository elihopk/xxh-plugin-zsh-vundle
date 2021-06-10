# XXH ZSH Plugin for Vundle

cd "$(dirname "$0")" 1>/dev/null
CURR_DIR="$(pwd)"
PLUGIN_NAME="xxh-plugin-zsh-vundle"

if [[ -v vundles ]]
then
    if [[ $XXH_VERBOSE == '2' ]]
    then
        echo "$PLUGIN_NAME: Vundles is set = $vundles"
    fi
else
    if [[ $XXH_VERBOSE == '2' ]]
    then
        echo "$PLUGIN_NAME: Vundles not set"
        exit 1
    fi
fi

newVundles=("${(@s/|/)vundles}")

rm pluginvimrc.vim 2>/dev/null
touch pluginvimrc.vim

echo -e "set nocompatible\nfiletype off\nset rtp+=$CURR_DIR/.vim/bundle/Vundle.vim\ncall vundle#begin()\nPlugin 'VundleVim/Vundle.vim'" >> pluginvimrc.vim


for i in "${newVundles[@]}"
do
    echo "Plugin $i" >> pluginvimrc.vim
done

echo -e "call vundle#end()\nfiletype plugin indent on" >> pluginvimrc.vim

if [[ -v customrc ]]
then
    newCustomRC=("${(@s/|/)customrc}")

    for i in "${newCustomRC[@]}"
    do
        echo $i >> pluginvimrc.vim
    done
fi

if [[ -f pluginvimrc.vim ]]
then
    export VIMINIT="source $CURR_DIR/pluginvimrc.vim"
else
    echo "$PLUGIN_NAME: pluginvimrc.vim not found!"
fi

vim +PluginInstall +qall -e -s
