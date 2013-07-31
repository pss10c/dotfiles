config
======

This repository contains some config files I use in different system like
shell, vim etc.

# Installation
Clone this repo into whatever folder you like.  Than create symlinks from file
of that folder e. g. for bash configs you'd want to run
```
cd ~ && ln -si <repo folder>/.bashrc* ~/
```
and for vim config
```
cd ~ && ln -si <repo folder>/.vimrc ~/
```

# vim
Vim config is the .vimrc file.  I use __Vundle__ as vim plugin manager. Check
[Vundle docs][1] for installation and config info.
Also vim with this config is setup mostly to code in Python. But it will work
great with other languages too.
Color scheme called __solarized__ will be install using Vundle when you'll run
`:BundleInstall` but colors of your terminal may be needed some changes to meet
desired color palette. Check [Solarized page][2] to get precise colors.
If you run Gvim or MacVim in GUI mode than you're good to go. With terminal
mode you can get color settings premade:
* Iterm2 [iterm2-colors-solarized][3]
* Gnome-terminal [gnome-terminal-colors-solarized][4]
* Find more on [Solarized homepage][2] or [Google][5]

I have experienced some problems with __Powerline__ vim plugin. If you see some
strange symbols in your status line than check [this page][6] about font
patching for __Powerline__ or use some [pre patched][7] ones and check your OS
manual on font installation.


# bash
All bash config files start with ".bash". This setup has made to support
couple of platforms at the same time (tested on OSX Lion and Ubuntu Linux).
NOTE: linux .bashrc file is a bit bulky and will be changed in the nearest
future. It is not recommended to use it now.

[1]: https://github.com/gmarik/vundle
[2]: http://ethanschoonover.com/solarized
[3]: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
[4]: https://github.com/sigurdga/gnome-terminal-colors-solarized
[5]: http://bit.ly/16kv1lI
[6]: https://powerline.readthedocs.org/en/latest/fontpatching.html
[7]: https://github.com/Lokaltog/powerline-fonts
