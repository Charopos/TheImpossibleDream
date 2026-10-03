#!/bin/bash

#Run this in the repo root after compiling
#First arg is path to where you want to deploy
#creates a work tree free of everything except what's necessary to run the game

#second arg is working directory if necessary
if [[ $# -eq 2 ]] ; then
  cd $2
fi

mkdir -p \
    $1/_maps \
    $1/icons/ \
	$1/strings

# SURREALIS ADDITION BEGIN
mkdir -p \
    $1/modular_tidi/code/modules/slave_collar/strings \
    $1/modular_tidi/code/game/objects/items/lewd/chastity/strings \
    $1/modular_tidi/code/datums/components/strings
# SURREALIS ADDITION END

if [ -d ".git" ]; then
  mkdir -p $1/.git/logs
  cp -r .git/logs/* $1/.git/logs/
fi

cp roguetown.dmb roguetown.rsc $1/
cp -r _maps/* $1/_maps/
cp -r icons/* $1/icons/
cp -r strings/* $1/strings/
# SURREALIS ADDITION BEGIN
cp -r modular_tidi/code/modules/slave_collar/strings/* $1/modular_tidi/code/modules/slave_collar/strings/
cp -r modular_tidi/code/game/objects/items/lewd/chastity/strings/* $1/modular_tidi/code/game/objects/items/lewd/chastity/strings/
cp -r modular_tidi/code/datums/components/strings/* $1/modular_tidi/code/datums/components/strings/
# SURREALIS ADDITION END

#remove .dm files from _maps

#this regrettably doesn't work with windows find
#find $1/_maps -name "*.dm" -type f -delete

#dlls on windows
if [ "$(uname -o)" = "Msys" ]; then
	cp ./*.dll $1/
fi
