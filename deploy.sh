#!/bin/sh -e

TIME=$(date "+%Y%m%d-%H%M%S")

# backup the .emacs file
if [ -d ~/.eamcs ]; then
    mv ~/.emacs ~/.emacs-${TIME}
fi

# backup the .emacs.d dir
if [ -d ~/.emacs.d ]; then
    mv ~/.emacs.d ~/.emacs.d-${TIME}
fi

# create the .emacs.d link to emacs.d dir
if [ ! -d .emacs.d ]; then
    ln -s emacs.d .emacs.d
fi

# stow the fold or create link to HOME
if which stow &> /dev/null; then
    stow -t ${HOME} .
    if [ -d ~/emacs.d  ]; then
        rm ~/emacs.d
    fi
else
    if [ ! -d ~/.emacs.d ]; then
        ln -s `pwd`/emacs.d ~/.emacs.d
    fi
fi

echo "Deploy Successful!"
