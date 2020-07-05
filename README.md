# glebchek's dotfiles

## Description

Well, this is heavily WIP. I just decided to organize my configs in dotfiles and I advise you not to use my dotfiles as reference (yet).

My configs are far from being optimal for now, but I will work on it. For example, nvim is not usable yet, zsh has beautiful prompt, but I think it is misconfigured in some places.

You are free to look, but keep in mind that it is not really usable because of the above reasons.

This repo makes use of **environment.d** directory, so your system should be based on *systemd*. Right now it is the only restriction, and I am considering to get rid of it.

### Neovim

I decided to use neovim's built-in LSP client, so that is why 0.5 version is required.

## Plugin managers

For now I am using these helpers:

- **vim-plug** for managing NVIM packages
- **zplug** for managing ZSH plugins and themes
- And of course **dotbot** to link all files from dotfiles folder to home directory

## Requirements

### Neovim

- neovim version 0.5 (nighly for now)
- lua
- npm install -g vscode-html-languageserver-bin vscode-css-languageserver-bin vscode-json-languageserver typescript-language-server

## TODO

- Bring back linting in neovim
- Make zsh config more optimized and useful
- Make configs more DE-independent and console-friendly
