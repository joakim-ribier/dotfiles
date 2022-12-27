# Manjaro Linux

### 22.0.0 Sikaris - I3

## TOC

* [I3](#i3)
* [Kernel](#kernel)
* [Package](#packages)
* [CMD](#cmd)

## I3

[README](/i3/README.md)

## Kernel

* Kernel name

```
$ uname -r
5.4.64-1-MANJARO
```

* List available

```
$ mhwd-kernel -l
available kernels:
 * linux414
 * linux419
 * linux44
 * linux49
 * linux54
 * linux57
 ...
```

* Upgrade

```
sudo mwhd-kernel -i linux57 && sudo reboot
```

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

    :warning: For all _aur_ packages you have to go through directly the Pamac (UI package manager).  

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

* Flameshot - Powerful yet simple to use screenshot software

    ```
    $ pacman -S community/flameshot
    ```

* Gnome terminal

    ```
    $ pacman -S extra/gnome-terminal
    ```

* Java

    https://wiki.archlinux.fr/java

    ```
    // install jdk version
    $ pacman -S jre8-openjdk

    // display the available versions
    $ archlinux-java status
    Available Java environments:
    java-11-openjdk
    java-8-openjdk (default)

    // set version
    $ archlinux-java set java-8-openjdk
    ```

* Keychain - A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login

    ```
    $ pacman -S keychain

    $ vim ~/.bashrc
    eval `keychain --eval --agents ssh id_rsa`
    ```

* Nautilus - Gnome folder management

    ```
    $ pacman -S extra/nautilus
    ```

* ntp - Network Time Protocol

    ```
    $ pacman -S ntp
    $ sudo timedatectl set-ntp true
    ```

* pip - The PyPA recommended tool for installing Python packages

    ```
    $ pacman -S extra/python2-pip
    ```

* Screen - Full-screen window manager that multiplexes a physical terminal

    ```
    $ pacman -S screen
    ```

#### Dev

* Code - The Open Source build of Visual Studio Code (vscode) editor

    ```
    $ pacman -S community/code
    ```

* Docker - Utility to pack, ship and run any application as a lightweight container

    ```
    $ pacman -S community/docker

    // start docker daemon immediatly
    $ systemctl start docker

    // enable on boot
    $ systemctl enable docker
    ```

    Troubleshooting:

    * docker: Got permission denied while trying...

        ```
        $ sudo chmod  666 /var/run/docker.sock
        ```

* Go - Google Language

    ```
    $ pacman -S go
    ```

* Intellij - IDE for Java, Groovy and other programming languages with advanced refactoring features

    ```
    $ pacman -S intellij-idea-community-edition
    ```

* jq - Command-line JSON processor

    ```
    $ pacman -S community/jq
    ```

* pgcli (from `pip`) - A command line interface for Postgres with auto-completion and syntax highlighting 

    ```
    $ pip install pgcli
    ```

* qgit - A GIT GUI viewer built on Qt/C++

    ```
    $ pacman -S community/qgit
    ```

* sbt - The interactive build tool

    ```
    $ pacman -S sbt
    ```

* scala - A Java-interoperable language with object-oriented and functional features

    ```
    $ pacman -S scala
    ```

#### Communication

* Slack Desktop (Beta) for Linux

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

### Tool

```
$ pacman -S bind-tools (dig: Lookup Utility...)

$ pacman -S net-tools (ifconfig...)
```

## CMD

### Network

* How to get your wifi #pwd
```
$ cat /etc/NetworkManager/system-connections/WIFI_NETWORK_NAME | grep psk=

> psk=MY_PWD
```


