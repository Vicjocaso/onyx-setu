#!/bin/bash

# Configure the bash shell using Onyx defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/onyx/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/onyx/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Onyx defaults
cp ~/.local/share/onyx/configs/inputrc ~/.inputrc
