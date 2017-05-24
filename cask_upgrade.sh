#!/usr/bin/env bash

(set -x; brew update;)
# (set -x; brew cask update;) # deprecated on January 1st

(set -x; brew upgrade;)

(set -x; brew cleanup;)
(set -x; brew cask cleanup;)

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

casks=( $(brew cask list) )

for cask in ${casks[@]}
do
    version=$(brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
    installed=$(find "/usr/local/Caskroom/$cask" -type d -mindepth 1 -maxdepth 1 -name "$version")

    if [[ -z $installed ]]; then
        echo "${red}${cask}${reset} requires ${red}update${reset}."
        (set -x; brew cask uninstall $cask --force;)
        (set -x; brew cask install $cask --force;)
    else
        echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
done
# create a Brewfile with an undated list of cask installed 1313
rm Brewfile
brew bundle dump

# git push to git server to keep all of this updated
git push -u origin master
