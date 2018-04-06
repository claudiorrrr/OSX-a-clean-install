#!/bin/bash

# A script to set up a new mac. Uses bash, homebrew, etc.
# Originally here https://gist.github.com/somebox/6b00f47451956c1af6b4
# I tweaked it because I'm not a developer and I'll host it here because I don't know how Gist work ;)

# Includes many utilities and apps:
# - homebrew, rvm, node
# - quicklook plugins, terminal fonts
# - browsers: chrome, firefox
# - dev: iterm2, sublime text, postgres, chrome devtools, etc.
# - team: slack, dropbox, google drive, skype, etc
# - utils: unarchiver, o-day, caffine, skitch, etc
# - productivity: evernote, viscosity, omnigraffle, karabiner, etc.


# Settings
node_version="0.12.2"
ruby_versions="1.9 2.1 2.2"
ruby_default="2.1"

# helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Install starting. You may be asked for your password (for sudo)."

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# requirements
cd ~
mkdir -p tmp
echo_warn "setting permissions..."
for dir in "/usr/local /usr/local/bin /usr/local/include /usr/local/lib /usr/local/share"; do
	sudo chgrp admin $dir
	sudo chmod g+w $dir
done

# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &> /dev/null; then
	echo_ok "Homebrew already installed"
else
    echo_warn "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# moar homebrew...
brew install caskroom/cask/brew-cask
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# brew taps
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap homebrew/games

# Homebrew base
brew install \
  aria2 autoconf automake bash bash-completion cowsay cmatrix \
  exiftool fish git pinentry gnupg gpg-agent mas mosh nmap pandoc pass pinentry-mac speedtest-cli stow tldr tor \
  syncthing wget wpscan yubico-piv-tool \
  ffmpeg figlet gettext go freetype htop-osx jq libxml2 mongodb node \
  phantomjs postgres qt readline sqlite unrar v8 wget youtube-dl

# brew cask fonts
echo_warn "Installing fonts..."
brew cask install \
  font-anonymous-pro \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans \
  font-droid-sans-mono font-droid-sans-mono-for-powerline \
  font-meslo-lg font-input \
  font-inconsolata font-inconsolata-for-powerline \
  font-liberation-mono font-liberation-mono-for-powerline \
  font-liberation-sans \
  font-meslo-lg \
  font-nixie-one \
  font-office-code-pro \
  font-pt-mono \
  font-raleway font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \
  font-ubuntu font-ubuntu-mono-powerline \
  font-clear-sans \
  font-firacode-nerd-font \
  font-hack \
  font-m-plus \
  font-open-sans \
  font-roboto

# Apps
echo_warn "Installing applications..."

# Favorites
brew cask install \
  1password appcleaner arq astro bartender brackets caffeine delibar \
  etcher firefox fluid fuse ghost github google-chrome \
  grammarly hyper iterm2 keybase little-snitch mailmate \
  mojibar notion plexamp signal skype slack spectacle \
  spotify steam sublime-text3 swinsian \
  telegram-desktop thunderbird torbrowser transmit vidyo viscosity vlc xld

echo
echo_ok "Done."
echo
echo "Then go to https://packagecontrol.io/installation for Package Control"
echo
echo "You may want to add the following settings to your .bashrc:"
echo_warn '  export HOMEBREW_CASK_OPTS="--appdir=/Applications"'
echo
