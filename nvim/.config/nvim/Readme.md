# what is this ?

<p align="center"> <a href="https://github.com/jinzhongjia/neovim-config/blob/main/Readme_CN.md">中文</a> </p>

This is my neovim config, and 100% lua!

And now it is can used on mainstream Linux distributions and widnows, all dependencies are modularized, you can easily use it on your computer after installing required external dependencies

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/main.gif)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/debug.gif)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/debug-js.gif)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/home.png)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/highlight.png)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/outline%20and%20tree.png)

## dependencies

It is recommended to use the system's package manager to install the following dependencies

- [Nerd fonts](https://www.nerdfonts.com/font-downloads)
- [git](https://git-scm.com/downloads)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lazydocker](https://github.com/jesseduffield/lazydocker)

## QuickStart

1. **Git clone configuration to local**

Then you clone this config with command:

> Unix, Linux

```bash
# This will git clone the neovim-config to your system path
git clone https://github.com/jinzhongjia/neovim-config ~/.config/nvim
```

2. **Open Nvim To Auto Configurate**

Now, you just need to use this command `nvim` to open neovim!

And then you will see that message which tell you missing a lot of plugins, dont worry, just press `ENTER` to continue, then the `packer` will Automatically install all plugins.

That looks cool, doesn't it?

3. **Exit And Reopen Neovim**

Exit and reopen neovim, it will auto install the lsp, dap, null-ts, treesitter dependencies!

Maybe you need to type `:checkhealth` to check out possible errors.

4. **Enjoy your self!**

Now, you have config `Neovim` completely, enjoy it!

## Recommend Environment

The following environments may be used in lsp (language server proctool), it is recommended to install!

- GO
- RUST
- CLANG
- GCC
- NODE
- RUBY
