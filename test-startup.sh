#!/bin/sh -e

# Make it look like this is ~/.emacs.d (needed for Emacs 24.3, at least)
export HOME=$PWD
if [ ! -d .emacs.d ]; then
    ln -s emacs.d .emacs.d    
fi

# install cask
if ! which cask &> /dev/null; then
    if which brew &> /dev/null; then
        brew install cask    
    fi 
fi

# run cask
cd emacs.d
cask install
echo "Cask installed package..."

echo "Attempting startup..."
${EMACS:=emacs} -nw --batch \
                --eval '(let ((debug-on-error t)
                              (url-show-status nil)
                              (user-emacs-directory default-directory)
                              (user-init-file (expand-file-name "init.el"))
                              (load-path (delq default-directory load-path)))
                           (load-file user-init-file)
                           (run-hooks (quote after-init-hook)))'
#if [ -d ../.emacs.d ]; then
# rm ../.emacs.d
# fi
echo "Test startup successful"

if [ -d .bash_history ]; then
    rm -rf .bash_history
fi
if [ -d .bash_sessions ]; then
    rm -rf .bash_sessions
fi 

