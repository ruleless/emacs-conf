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
if [ ! -f ~/.emacs.d/custom/my-settings.el ];
then
    mkdir -p ~/.emacs.d/custom
	cp my-settings.el ~/.emacs.d/custom/my-settings.el
	echo "copy my-settings.el ..."
fi

echo "before start, check if 'ggtags-mode' is installed"
echo "before start, check if 'js2-mode' is installed"
echo "before start, check if 'company' is installed"
echo "before start, check if 'dash' is installed"
echo "before start, check if 'names' is installed"
echo "before start, check if 'cquery' is installed"
