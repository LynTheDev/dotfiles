#!/bin/bash

# Colours
RED='\033[0;31m'
NC='\033[0m'

# This is a quick way to setup github commit address.. made for me personally..
if [ -z "$1" ] || [ -z "$2" ]; then
    printf "${RED}ERROR: email or username missing!${NC}"
    echo ""
    echo "NOTE: github emails are <ID>+<NAME>@users.noreply.github.com"
    echo "Usage: gh_setup {email} {username}"

    exit 1
fi

# Setup variables
EMAIL=$1
USERNAME=$2

# Setup git
git config --global user.email "${EMAIL}"
git config --global user.name "${USERNAME}"