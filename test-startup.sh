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
echo "Cask installed package..."
cask install

echo "Attempting startup..."
${EMACS:=emacs} -nw --batch \
                --eval '(let ((debug-on-error t)
                              (url-show-status nil)
                              (user-emacs-directory default-directory)
                              (user-init-file (expand-file-name "init.el"))
                              (load-path (delq default-directory load-path)))
                           (load-file user-init-file)
                           (run-hooks (quote after-init-hook)))'

echo "Test startup successful"

