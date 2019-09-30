# Manjaro Linux

### 18.0.4 Illyria - I3

## TOC

* [I3](#i3)
* [Package](#packages)

## I3

[README](/i3/README.md)

## Packages

There are two "package manager" system on [archlinux](https://www.archlinux.org/).

* pacman

[wiki - pacman](https://wiki.archlinux.fr/pacman)

To update all packages: `$ pacman -Syu --overwrite`

_`--overwrite`: fix packages conflicts if needed_

* yaourt

[wiki - yaourt](https://wiki.archlinux.fr/yaourt)

### System

* Gnome terminal
```
yaourt -S extra/gnome-terminal
```

* Keychain

```
$ yaourt -S keychain

$ vim ~/.bashrc
eval `keychain --eval --agents ssh id_rsa`
```

#### Dev

* Intellij

```
$ yaourt -S intellij-idea-community-edition
```

* Visual Studio Code (from `aur` repo)
```
$ yaourt -S code
```

### Internet

* Chrome (from `aur` repo)
```
$ yaourt -S google-chrome
```

