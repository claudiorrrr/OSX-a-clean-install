# Mac OS X - una instalación limpia 

Esta es mi receta para instalación limpia de OSX. Acá debieran estar tanto las apps que uso como también los programas básicos de una instalación limpia. En el fondo, es un gran recordatorio.

Lo bueno es que en el fondo esto facilita el proceso de hacer instalaciones limpias cada 6 meses, algo recomendable: mantiene el sistema limpio, rápido y seguro. 

## Install Software

* Open Terminal app
* Install Homebrew via
```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```
* Copy [the Brewfile](Brewfile) to your home folder
* Type ```brew bundle```, if prompted, sign in your Apple ID for mas-cli.

Then wait for brew bundle to automatically install all your apps. During this time, you just migrate your backup files back to your new Mac like the way you backup them.

## Actualizar todo

```bash
$ sh cask_upgrade.sh
```

## Añadir al crontab -e

```bash
$ crontab -e
```

```bash
0 11 * * * /Users/cla-/github/OSX-a-clean-install/cask_upgrade.sh
0 18 * * * /Users/cla-/github/OSX-a-clean-install/cask_upgrade.sh
```
