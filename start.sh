#!/usr/bin/env bash

NC="\033[0;39m"
YELLOW='\033[1;33m'
RED="\033[31m"
BLUE="\033[34m"

function warn {
    echo -e "$RED" "$1 $NC"
}

function info {
    echo -e "$YELLOW" "$1 $NC"
}

info "Cleaning up repo..."

rm *.md
rm Makefile
rm -rdf .gitw
rm start.sh

mv TEMPLATES/* .
rm -d TEMPLATES
rm -rdf DOCS

info "Done"
