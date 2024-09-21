# Wiktor's dotfiles

# Table of Contents
- [Wiktor's dotfiles](#wiktors-dotfiles)
- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Using script](#using-script)

# Overview
Repository contains my personal config files as well as scripts necessary to link all files. The goal is to be able to set up config for all the programs in as few steps as it is possible.

Repository also contains optional scripts necessary to install all the programs the configs are set up for and the dependencies.

# Installation

## Prerequisites
Make sure to have `git` installed. Here are the examples of installing git for chosen distributions.

**Debian**
```
sudo apt-get install git
```

**Arch**
```
sudo pacman -S git
```

**Fedora**
```
sudo dnf install git
```

Clone the repository to the local repos directory:
```
git clone https://github.com/wchocian/dotfiles.git
```

## Using script
```
./link.sh
```