#!/bin/sh

. ./scripts/

mkdir -p  ~/.emacs.d/echo_hints.sh

echo "install site-lisp shell ..."
cp -rf site-lisp ~/.emacs.d/

echo "install elpa shell ..."
cp -rf elpa ~/.emacs.d/

echo "install ac-dict ..."
cp -rf ac-dict ~/.emacs.d/

echo "install snipptes ..."
cp -rf snippets ~/.emacs.d/

cp .emacs ~/.emacs

if [ ! -f ~/.emacs.d/custom/my-settings.el ]; then
    mkdir -p ~/.emacs.d/custom
	cp my-settings.el ~/.emacs.d/custom/my-settings.el
	echo "copy my-settings.el ..."
fi

echo "install TabNine binary ..."
if [ ! -d ~/.TabNine/2.8.6 ] && [ -d ./.TabNine/2.8.6 ]; then
	mkdir -p ~/.TabNine
	cp -rf ./.TabNine/2.8.6 ~/.TabNine/
fi

echo_hints
