#!/bin/bash

. ./scripts/echo_hints.sh

mkdir -p  ~/.emacs.d

echo "install site-lisp shell ..."
cp -rf site-lisp ~/.emacs.d/

echo "install elpa shell ..."
cp -rf elpa ~/.emacs.d/

echo "install ac-dict ..."
cp -rf ac-dict ~/.emacs.d/

echo "install snipptes ..."
cp -rf snippets ~/.emacs.d/

cp .emacs ~/.emacs

echo "install TabNine binary ..."
if [ ! -d ~/.TabNine/2.8.6 ] && [ -d ./.TabNine/2.8.6 ]; then
	mkdir -p ~/.TabNine
	cp -rf ./.TabNine/2.8.6 ~/.TabNine/
fi

echo ""
echo_hints
echo ""
echo_hints_of_go_mode_dependencies
