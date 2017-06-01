#!/usr/bin/env bash

date

(set -x; /usr/local/bin/brew update;)
(set -x; /usr/local/bin/brew upgrade;)

(set -x; /usr/local/bin/brew cleanup;)
(set -x; /usr/local/bin/brew cask cleanup;)

# red=`tput setaf 1`
# green=`tput setaf 2`
# reset=`tput sgr0`

casks=( $(/usr/local/bin/brew cask list) )

for cask in ${casks[@]}
do
    version=$(/usr/local/bin/brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
    installed=$(find "/usr/local/Caskroom/$cask" -type d -mindepth 1 -maxdepth 1 -name "$version")

    if [[ -z $installed ]]; then
        echo "${red}${cask}${reset} requires ${red}update${reset}."
        (set -x; /usr/local/bin/brew cask uninstall $cask --force;)
        (set -x; /usr/local/bin/brew cask install $cask --force;)
    else
        echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
done

# create a Brewfile with an undated list of cask installed 1313

rm /Users/cla-/github/OSX-a-clean-install/Brewfile
cd /Users/cla-/github/OSX-a-clean-install/
/usr/local/bin/brew bundle dump
