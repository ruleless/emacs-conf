#!/bin/sh

if [ ! -d ~/.emacs.d/site-lisp ];
then
	mkdir -p ~/.emacs.d/site-lisp
fi

echo "install site-lisp shell ..."
cp -rf site-lisp ~/.emacs.d/

echo "install ac-dict ..."
cp -rf ac-dict ~/.emacs.d/

echo "install snipptes ..."
cp -rf snippets ~/.emacs.d/

cp .emacs ~/.emacs

echo "before start, check if 'ggtags-mode' is installed"
