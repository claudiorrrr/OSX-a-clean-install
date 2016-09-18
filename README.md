# Mac OS X - una instalación limpia 

Esta es mi receta para instalación limpia de OSX. Acá debieran estar tanto las apps que uso como también los programas básicos de una instalación limpia. En el fondo, es un gran recordatorio.

Lo bueno es que en el fondo esto facilita el proceso de hacer instalaciones limpias cada 6 meses, algo recomendable: mantiene el sistema limpio, rápido y seguro. 

## Install Software

```bash
$ sh Install-Config.sh
```

Ver [Install-Config](https://github.com/claudioruiz/OSX/blob/master/Install-Config.sh)

# OS X Preferences

```bash

#Show the ~/Library folder
chflags nohidden ~/Library

#Store screenshots in subfolder on desktop
mkdir ~/Downloads/Screenshots
defaults write com.apple.screencapture location ~/Downloads/Screenshots
```

Set hostname
------------
`sudo scutil --set HostName [name]`

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
[CoffeeScriptHaml](https://github.com/jisaacks/CoffeeScriptHaml)
auto-save
AutoSpell
DictionaryAutoComplete
DictionaryFreeWindow
Markdown Extended
MarkdownEditing
Monikai Extended
Monokai Gray
Package Control
Pandoc
WordCount

Install Soda Theme
----------------------
```bash
git clone git://github.com/buymeasoda/soda-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Theme\ -\ Soda
```

Settings
--------

**Sublime Text > Preferences > Settings - User**

```json
{
    "color_scheme": "Packages/Monokai Extended/Monokai Extended.tmTheme",
    "font_face": "Mensch",
    "font_size": 14,
    "ignored_packages":
    [
        "Markdown",
        "Vintage"
    ],
    "line_numbers": false,
    "word_wrap": true,
    "wrapWidth": 80,
}

```


![aww yeah](http://i.imgur.com/AmFax.gif)
