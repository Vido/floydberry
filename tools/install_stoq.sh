#! /bin/sh

# This is a simple script that allows you to checkout stoq and it's dependencies
# Installation
#
#  $ wget https://raw.github.com/stoq/git-stoq/master/git-stoq -O ~/bin
#  $ chmod +x ~/bin/git-stoq
#
# Development setup:
#
#  $ git-stoq --setup
#
# Creating a new branch:
#
#  $ git-stoq --init master
#
# Entering development mode for the default branch:
#
#  $ git-stoq
#
# Or if you choose to use repo, setup the development and, instead of
# initiating a new branch, just run:
#
#  $ git-stoq --repo
#
#
# If you want to display the current tree of Stoq, include $STOQ_BRANCH
# in your PS1, for example:
#
#  export PS1='[$(echo $STOQ_BRANCH)]\u@$ENVNAME$(__git_ps1 "(%s)"):\w\$ '

mkdir ~/bin
wget https://raw.github.com/stoq/git-stoq/master/git-stoq -O ~/bin/git-stoq
chmod +x ~/bin/git-stoq
./bin/git-stoq --setup

