# mynvim

My setup for [neovim](https://github.com/neovim/neovim) aiming to provide feature-rich text editor.

It is inspired by [Neovim from scratch](httpsL//github.com/LunarVim/Neovim-from-scratch) project. There are also series of videos by the authors with verbose commentary, so I highly recommend to look it up.

## Installation

You must install neovim the editor. You can do that via your favorite package manager or building it directly from source.
Following steps are for latter option.

First, you need to install dependencies. These are the missing ones on a clean installation of Arch Linux (with base-devel package):

- cmake
- unzip
- git (assuming you aren't using it yet)

```
$ mkdir -p ~/.local/src
$ cd ~/.local/src
$ git clone https://github.com/neovim/neovim.git
$ cd neovim
$ make CMAKE_BUILD_TYPE=RelWithDebInfo
$ sudo make install
```

After you installed neovim you can clone this repo in your `~/.config/nvim/` directory.

```
$ mkdir -p ~/.config/nvim
$ git clone https://github.com/bulirma/mynvim.git ~/.config/nvim
```

## Features

Neovim in it self provides a lot of features one would expect an IDE should have.
Following list consists of feature this setup is using.
To use these features you must type commands.
This setup provides shortcuts to execute the commands. Look at `/lua/mynvim/keymaps.lua`.

- file explorer
- tabs

Neovim is also designed in a way that IDE features shall be integrated via plugins. You can find list of used plugins in `/lua/mynvim/plugins.lua` file.

- completion
- fuzzy finder
