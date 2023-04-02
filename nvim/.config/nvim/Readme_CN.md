# 这是什么？

这是作者（我）所使用的 neovim 配置，具备开箱即用的特点，并且配置文件 100%`Lua`，可以放心食用！

该配置文件可以在主流 Linux 发行版和 Windows 上使用，操作很简单，只需要安装好几个必备的依赖就可以轻松使用！

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/main.gif)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/debug.gif)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/debug-js.gif)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/home.png)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/highlight.png)

![](https://github.com/jinzhongjia/neovim-config/blob/main/image/outline%20and%20tree.png)

## 必备依赖

- [Nerd fonts](https://www.nerdfonts.com/font-downloads)
- [git](https://git-scm.com/downloads)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lazydocker](https://github.com/jesseduffield/lazydocker)

## 快速开始

1. **Gie clone 配置文件到本地**

你可以通过以下命令`clone`配置到本地：

> Unix, Linux

```bash
# This will git clone the neovim-config to your system path
git clone https://github.com/jinzhongjia/neovim-config ~/.config/nvim
```

2. **打开 Nvim,自动化安装**

现在，你只需要使用命令`nvim`打开 neovim,然后你应该会看到会有一些消息警告你缺少了一大堆插件，别着急，按下`ENTER`继续，随后`packer`将会自动安装完成所有的插件！

3. **退出并重新进入 neovim**

退出并重新进入 neovim,这时它会自动安装所需的依赖（lsp、dap、null-ts、tresitter）,可以使用`:checkhealth`来进行错误检测，可以按照其中的 error 选择性修复。

4. **享受`neovim`开发**

现在，所有插件应该已经安装完成了，好好享受使用`Neovim`开发吧

## 推荐本地使用的环境

以下的环境可能会在 lsp(language server proctool)中使用，推荐安装！

- GO
- RUST
- CLANG
- GCC
- NODE
- RUBY
