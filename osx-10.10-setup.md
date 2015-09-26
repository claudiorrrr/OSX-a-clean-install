# Mac OS X 10.10 Yosemite

Custom recipe to get OS X 10.10 Yosemite running from scratch, setup applications and developer environment. I use this gist to keep track of the important software and steps required to have a functioning system after a semi-annual fresh install. On average, I reinstall each computer from scratch every 6 months, and I do not perform upgrades between distros.

This keeps the system performing at top speeds, clean of trojans, spyware, and ensures that I maintain good organizational practices for my content and backups. I highly recommend this.

You are encouraged to fork this and modify it to your heart's content to match your own needs.

## Install Software

The software selected is software that is "tried and true" --- software I need after any fresh install. I often install other software not listed here, but is handled in a case-by-case basis.

### Install from App Store

* [Airmail](https://itunes.apple.com/us/app/airmail/id573171375?mt=12&uo=4)
* [Aperture](https://itunes.apple.com/us/app/aperture/id408981426?mt=12&uo=4)
* [Degrees](https://itunes.apple.com/us/app/degrees/id430173763?mt=12&uo=4)
* [Divvy](https://itunes.apple.com/us/app/divvy-window-manager/id413857545?mt=12&uo=4)
* [Opera](https://itunes.apple.com/us/app/opera/id404764921?mt=12&uo=4)
* [Pages](https://itunes.apple.com/us/app/pages/id409201541?mt=12&uo=4)
* [Skitch](https://itunes.apple.com/us/app/skitch-snap.-mark-up.-share./id425955336?mt=12&uo=4)
* [Twitter](https://itunes.apple.com/us/app/twitter/id409789998?mt=12&uo=4)
* [WiFi Explorer](https://itunes.apple.com/us/app/wifi-explorer/id494803304?mt=12&uo=4)
* [WiFi Signal](https://itunes.apple.com/us/app/wifi-signal/id525912054?mt=12&uo=4)
* [Todoist](https://itunes.apple.com/us/app/todoist-to-do-list-task-list/id585829637?mt=12&uo=4)
* [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12&uo=4)

### Install from Third-Party Websites

* Browsers
	* Chrome (installed via Cask)
	* [Firefox](http://firefox.com)
	* Opera (installed via App Store)
	* [Webkit](http://webkit.org)

* Development
	* [Dropbox](https://www.dropbox.com/install2)
	* [Sublime Text 3](http://www.sublimetext.com/3)

* Utilities
	* [1Password](https://agilebits.com/onepassword/mac)
	* [GrandPerspective](http://grandperspectiv.sourceforge.net/)
	* iTerm 2 (installed via Cask)
	* [Skype](http://www.skype.com/en/download-skype/skype-for-computer/)
	* [Spotify](https://www.spotify.com/us/download/mac/)
	* [Transmit](http://panic.com/transmit)

Fonts
-----
[Mensch coding font](http://robey.lag.net/2010/06/21/mensch-font.html)
[Inconsolata?]

#Homebrew

## Install Homebrew
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
```

At the time of this writing, `brew doctor` says that `Xcode 6.1` is required, which means downloading it from the Apple Developer Center until it is released in the Mac App Store.

## Install Homebrew extension Cask
```bash
brew install caskroom/cask/brew-cask
```

## Install common applications via Homebrew
```bash
brew install curl mosh tmux wget autoconf fontconfig gnupg lftp libtasn1 mutt-patched pkg-config tmux xapian automake freetype gnupg2 libassuan libtiff nagios protobuf tokyo-cabinet xvid bitlbee gd gnutls libevent libusb nagios-plugins pth tor xz bmon gdbm gpg-agent libffi libusb-compat nettle python tree youtube-dl brew-cask gettext gpgme libgcrypt libvo-aacenc notmuch readline urlview dirmngr glib irssi libgpg-error mobile-shell openssl s-lang vim ffmpeg gmime jpeg libksba multimarkdown pcre sqlite wget fish gmp lame libpng mutt pinentry talloc x264
```

## Install applications via Homebrew Cask
```bash
brew cask install adobe-reader
brew cask install bartender
brew cask install battery-guardian
brew cask install caffeine
brew cask install calibre
brew cask install chromium
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install mactex
brew cask install mumble
brew cask install nmap
brew cask install mpv
brew cask install onyx
brew cask install plex-media-server
brew cask install popcorn-time
brew cask install spectacle
brew cask install steam
brew cask install sublime-text3
brew cask install thunderbird  
brew cask install transmission
brew cask install vlc
```

## Install Parallels plugin for Vagrant
```
vagrant plugin install vagrant-parallels
```

See http://parallels.github.io/vagrant-parallels/ for more details.


#Shell

Install custom .dotfiles
```bash
git clone git@github.com:kevinelliott/.dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

Update .bash_profile
```bash
echo 'source ~/.dotfiles/base.sh' >> ~/.bash_profile
```

# OS X Preferences

```bash

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
```

Set hostname
------------
`sudo scutil --set HostName SpaceX-Falcon-9`


#Git

Setup Github
------------
```bash
ssh-keygen -t rsa -C "kevin@welikeinc.com"

# Copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

# Test connection
ssh -T git@github.com

# Set git config values
git config --global user.name "Kevin Elliott"
git config --global user.email "kevin@welikeinc.com"
git config --global github.user kevinelliott
git config --global github.token your_token_here

git config --global core.editor "subl -w"
git config --global color.ui true
```


# Sublime Text

Add Sublime Text CLI
--------------------

```bash
mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```

Install Package Control
-----------------------

Run `Sublime Text 3` and access the console via the `CTRL + ``` shortcut or the `View > Show Console` menu.

```
import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

See https://sublime.wbond.net/installation for more information. Their site has a note that this install code will change for each new release, so it would be good to check once in a while.

Install Packages
----------------
[BracketHighlighter](https://github.com/facelessuser/BracketHighlighter)
[CoffeeScriptHaml](https://github.com/jisaacks/CoffeeScriptHaml)


Install Soda Theme
----------------------
```bash
git clone git://github.com/buymeasoda/soda-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Theme\ -\ Soda
```

Install Tomorrow Theme
----------------------
```bash
git clone git://github.com/chriskempson/textmate-tomorrow-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Tomorrow
```

Settings
--------

**Sublime Text > Preferences > Settings - User**

```json
{
    "close_windows_when_empty": true,
    "color_scheme": "Packages/Color Scheme - Tomorrow/Tomorrow-Night-Eighties.tmTheme",
    "draw_indent_guides": false,
    "font_face": "Mensch",
    "font_size": 18,
    "highlight_modified_tabs": true,
    "show_tab_close_buttons": false,
    "tab_size": 2,
    "spell_check": false,
    "theme": "Soda Light.sublime-theme",
    "word_separators": "./\\()\"'-:,.;<>~!@#%^&*|+=[]{}`~?"
}
```

Key Bindings
------------

```json
[
	{ "keys": ["super+b"], "command": "expand_selection", "args": {"to": "brackets"} },
	{ "keys": ["super+f"], "command": "show_panel", "args": {"panel": "replace"} },
	{ "keys": ["super+alt+f"], "command": "show_panel", "args": {"panel": "find"} }
]
```


Snippets
--------
```bash
git clone git@github.com:bytestudios/sublime-snippets.git "/Users/Joel/Library/Application Support/Sublime Text 2/Packages/Byte"
```

![aww yeah](http://i.imgur.com/AmFax.gif)
