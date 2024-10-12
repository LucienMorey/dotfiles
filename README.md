# Lucien's Dotfiles

This repository contains my personal dotfiles to bootstrap an installation on an Ubuntu Linux machine. It utilises [Dotbot](https://github.com/anishathalye/dotbot) under the hood to automate installation of a [profile specification](meta/profiles/). Each profile specification defines a list of config specifications outlining setup. The available configs are specified in the [configs directory](meta/configs/).

## Installation

Clone down the repository, change to the new directory and run the install script. I run the workstation profile as a default.

```bash
git clone https://github.com/LucienMorey/dotfiles.git
cd dotfiles
./install-profile workstation
```

An executable for individual config installation is also offered. Configs can be run as sudo be adding the sudo suffix to the config-name.

```bash
./install-standalone nvim-config nvim-install-sudo
```

## Features

The installation script provides the following utility

- Install a basic set of development tools I use commonly in my workflow
- Install a set of formatters used commonly in my development
- Install utility apps for music, communication and password management
- configure my preferred shell environment (oh-my-zsh, p10k and tmux)
- configure a basic neovim development environment

## Future

- Add vscode config
- Extend tmux configuration
- Extend neovim configuration
- setup full preferred git configuration defaults

## License

Copyright (c) Lucien Morey. Released under the MIT License. See [license](LICENSE.md) for details.
