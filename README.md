# mulle-web-developer

#### 🎒 MulleWeb developer kit for mulle-sde

**mulle-web-developer** is a collection of *mulle-sde extensions* to support
development with [MulleWeb](//github.com/MulleWeb).



| Release Version                                       | Release Notes
|-------------------------------------------------------|--------------
| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleWeb/mulle-web-developer.svg?branch=release) [![Build Status](https://github.com/MulleWeb/mulle-web-developer/workflows/CI/badge.svg?branch=release)](//github.com/MulleWeb/mulle-web-developer/actions) | [RELEASENOTES](RELEASENOTES.md) |



## Usage

The following examples show how to set up a *MulleWeb* project with the
*mulle-sde* environment.

### Create an Objective-C executable project

Use either `mulle-web/webclient-developer` or `mulle-web/webserver-developer`
as the starting point:

```
mkdir foo
cd foo
mulle-sde init -m mulle-web/webserver-developer executable
```

Just follow the instructions *mulle-sde* prints.

> There will be an error because of a missing MulleObjCDecimalLibrary. This
> is normal.


### Create an Objective-C library project

```
mulle-sde init -d foolib -m mulle-web/webclient-developer library
cd foolib
mulle-sde craft
```


### Don't create a project but get ObjC libraries built

```
mulle-sde init -m mulle-web/webclient-developer none
mulle-sde craft
```





### You are here

![Overview](overview.dot.svg)



## Install

The install will need about 2 GB of free space.

The initial install will only add *mulle-sde* and *mulle-clang* to your
system. MulleWeb itself will be fetched by *mulle-sde*, when you create
a new project (see **Usage** below).

These installation methods are available:

* **Packages**
* **Docker**
* **Script**


### Packages

| OS      | Package manager | Command
|---------|-----------------|-----------------------------------
| macos   | homebrew        | `brew install mulle-kybernetik/software/mulle-web-developer`
| debian  | apt             | `sudo apt-get -y install mulle-web-developer` (but see below)
| ubuntu  | apt             | `sudo apt-get -y install mulle-web-developer` (but see below)


#### apt

As prerequisites there are some very basic packages that need to be installed
first. They are usually present on anything but a barebones system.


##### Prerequisites

Package               | Comment
----------------------|--------------------------
`wget` or `curl`      | to fetch stuff
`gnupg`               | *apt-key* may require it
`lsb-release`         | For the repository source list
`apt-transport-https` | To let *apt-get* fetch via https
`sudo`                | Or run everything as root


``` sh
apt-get install apt-transport-https gnupg lsb-release sudo wget
```

From here on it's assumed, that sudo is installed. If you don't have *sudo*,
edit out the *sudo* from the command lines and run everything as `root`


##### One line install

You can use this one-liner to do all the following steps in one:

``` sh
wget -qO - https://raw.githubusercontent.com/MulleWeb/mulle-web-developer/release/bin/apt-installer | sudo sh
```


##### Install the GPG keys:

Otherwise first add the necessary key to *apt*:

``` sh
wget -qO - "https://www.mulle-kybernetik.com/dists/debian-admin-pub.asc" | sudo apt-key add -
```

##### Add the *apt* repository source list:

``` sh
echo "deb [arch=all] http://www.mulle-kybernetik.com `lsb_release -c -s` main" | sudo tee "/etc/apt/sources.list.d/mulle-kybernetik.com-main.list" > /dev/null
```

Now you are ready to install *mulle-web-developer*:

``` sh
sudo apt-get update
sudo apt-get install mulle-web-developer
```


### Docker

There is a [Dockerfile](https://raw.githubusercontent.com/MulleWeb/mulle-web-developer/release/Dockerfile) in the project. To build and run an ephemeral development container named `mulle-web-developer` based on ubuntu, do:

``` sh
sudo docker build -t mulle-web-developer 'https://raw.githubusercontent.com/MulleWeb/mulle-web-developer/release/Dockerfile'
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t --rm mulle-web-developer
```

### Script

*mulle-sde* provides an
[installer-all](https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all)
script to install *mulle-web-developer* into `/usr` (or some other place).
This is suitable for environments without supported package managers like for
instance *Fedora* or *FreeBSD*.

| Prerequisites         | Comment
|-----------------------|--------------------------
| `build-essential`     | The usual compiler tools like cc, ar, nm
| `curl`                | To fetch stuff, or substitute with wget
| `cmake`               | Shoot for cmake 3.1 or higher
| `sudo`                | Or run everything as root
| `bsdmainutils`        | Needed for `column`. A dependency that should go away...
| `less`                | Should be optional, but isn't right now


#### Install into /usr with sudo

``` sh
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all' && \
chmod 755 installer-all && \
sudo OTHER_PROJECTS="MulleWeb/mulle-web-developer;latest \
MulleFoundation/foundation-developer;latest \
MulleFoundation/mulle-foundation-developer;latest \
mulle-objc/mulle-objc-developer;latest \
mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest \
mulle-test;latest" \
./installer-all /usr
```

#### Install into ${HOME} (without sudo)

``` sh
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all' && \
chmod 755 installer-all && \
OTHER_PROJECTS="MulleWeb/mulle-web-developer;latest \
MulleFoundation/foundation-developer;latest \
MulleFoundation/mulle-foundation-developer;latest \
mulle-objc/mulle-objc-developer;latest \
mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest \
mulle-test;latest" \
./installer-all ~ no
```


### Platforms and Compilers

All platforms and compilers supported by
[mulle-c11](//github.com/mulle-c/mulle-c11).


## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK  

