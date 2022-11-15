# mynvim

My setup for neovim aiming to provide feature-rich text editor.

## Installation

You must install neovim. You can do that via your favorite package manager or building it directly from source.
Following steps are for latter option.

First, you need to install dependencies. These are the missing on a clean installation of archlinux (with base-devel package):

- cmake
- unzip
- git (assuming you aren't using it yet)

```
$ mkdir -p ~/.local/src
$ cd ~/.local/src
$ git clone https://github.com/neovim/neovim.git
$ make CMAKE_BUILD_TYPE=RelWithDebInfo
$ sudo make install
```

After you installed neovim you can clone this repo in your `~/.config/nvim/` directory.
