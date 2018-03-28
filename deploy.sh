#!/bin/sh -e
# install cask
if ! which cask &> /dev/null; then
    if which brew &> /dev/null; then
        brew install cask    
    fi 
fi

# create the .emacs.d link
if [ ! -d .emacs.d ]; then
    ln -s emacs.d .emacs.d
fi

# stow the fold or create link to HOME
if which stow &> /dev/null; then
    stow -t ${HOME} .
else
    if [ ! -d ~/.emacs.d ]; then
        ln -s `pwd`/emacs.d ~/.emacs.d
    fi
fi

cd ~/.emacs.d
# run cask
cask install
echo "Cask installed package..."

if [ -d .bash_history ]; then
    rm -rf .bash_history
fi
if [ -d .bash_sessions ]; then
    rm -rf .bash_sessions
fi 
