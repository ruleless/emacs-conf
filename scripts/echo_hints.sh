#!/bin/bash

NEEDED_PACKAGES=(
    "gtags"

    # "ggtags-mode"
    # "js2-mode"
    # "company"
    # "dash"
    # "names"
    # "cquery"
)

function echo_hints()
{
    for package in "${NEEDED_PACKAGES[@]}"; do
        echo "before start, check if '${package}' is installed"
    done
}

function echo_hints_of_go_mode_dependencies()
{
    cat <<EOF
Go get these tools for 'go-mode':

  go get -u github.com/mdempsky/gocode
  go get github.com/rogpeppe/godef
  go get -u github.com/dougm/goflymake
  go get golang.org/x/tools/cmd/goimports
  go get golang.org/x/tools/cmd/godoc
EOF
}
