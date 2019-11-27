# Manjaro Linux

### 18.0.4 Illyria - I3

## TOC

* [I3](#i3)
* [Package](#packages)

## I3

[README](/i3/README.md)

## Packages

[Pacman](https://wiki.archlinux.fr/pacman) is the main package manager system on [archlinux](https://www.archlinux.org/).

Commands list:

* Update all package

    ```
    $ pacman -Sy
    ```

* Update and install all packages

    ```
    $ pacman -Syu
    ```

    Options: 

    * _`--overwrite='*'`_ // Fix packages conflicts
    * _`--ignore pacman`_ // Ignore package "pacman" (for example) if _`--overwrite='*'`_ does not working

    :warning: For _aur_ packages you have to go through directly the Pamac (UI package manager).  

* Search package

    ```
    $ pacman -Ss nautilus

    extra/libnautilus-extension 3.34.1-1 [installé]
    Library for extending the Default file manager for GNOME
    extra/nautilus 3.34.1-1 (gnome) [installé]
    Default file manager for GNOME
    extra/nautilus-legacy 3.26.4-2
    ...
    ```

* Install package

    ```
    $ pacman -S extra/nautilus
    ```

#### System

* Gnome terminal
```
$ pacman -S extra/gnome-terminal
```

* Keychain

```
$ pacman -S keychain

$ vim ~/.bashrc
eval `keychain --eval --agents ssh id_rsa`
```

* Nautilus (folder management)
```
$ pacman -S extra/nautilus
```

* NTP - Network Time Protocol

```
$ pacman -S ntp
$ sudo timedatectl set-ntp true
```

* Screen - Full-screen window manager that multiplexes a physical terminal
```
$ pacman -S screen
```

#### Dev

* Intellij

```
$ pacman -S intellij-idea-community-edition
```

* Visual Studio Code (from `aur` repo)
```
$ pacman -S code
```

#### Communication

* Slack

```
$ pacman -S slack-desktop
```

### Internet

* Chrome (from `aur` repo)
```
$ pacman -S google-chrome
```

* OpenVPN (from `aur` repo)
```
$ pacman -S openvpn
```