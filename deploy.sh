#!/bin/sh -e

# backup the .emacs file
if [ -d ~/.emacs ]; then
    mv ~/.emacs ~/.emacs.backup
fi 

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
echo "Cask installed package..."
cask install
echo "Deploy Successful!"
