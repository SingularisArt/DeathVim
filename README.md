<p align="center">💀 A Hackable, Fully Featured, Rice Friendly NeoVim Configuration 💀</p>

<p align="center">
  <a href="https://github.com/SingularisArt/Death.NeoVim/stargazers">
    <img alt="Stars" src="https://img.shields.io/github/stars/SingularisArt/Death.NeoVim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
  <a href="https://github.com/SingularisArt/Death.NeoVim/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/SingularisArt/Death.NeoVim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41"></a>
  <a href="https://github.com/SingularisArt/Death.NeoVim">
    <img alt="Repo Size" src="https://img.shields.io/github/repo-size/SingularisArt/Death.NeoVim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"/></a>
  <a href="https://github.com/SingularisArt/Death.NeoVim">
    <img alt="License" src="https://img.shields.io/github/license/SingularisArt/Death.NeoVim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"/></a>
</p>

<p align="center">
  <img src="https://stars.medv.io/SingularisArt/Death.NeoVim.svg", title="commits"/>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/logo.jpg", title="logo"/>
</p>

# Gallery

<p align="center">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-01.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-02.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-03.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-04.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-05.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-06.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-07.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-08.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-09.png">
  <img src="https://raw.githubusercontent.com/SingularisArt/DeathVim/media/screenshot-10.png">
</p>

# Features

- Install in one line of code (view [here](#installation) for more info).
- Blazingly fast.
- Written in 100% **Lua**.
- Easily able to install (view [here](#install-language-support) for more info):
  - LSP
  - Debuggers
  - Formatters
  - Linters
  - TreeSitter Parsers
- Git integration with [vim-fugitive](https://github.com/tpope/vim-fugitive)
  and [vim-gitgutter](https://github.com/airblade/vim-gitgutter).
- Multiple statuslines.
- Code snippets powered by [UltiSnips](https://github.com/SirVer/ultisnips).
- Dynamic homepage with [alpha-vim](https://github.com/goolord/alpha-nvim).
- Distraction free writing with
  [ZenMode](https://github.com/folke/zen-mode.nvim) and
  [Twilight](https://github.com/folke/twilight.nvim).
- Common sense keybindings.
- Uses [Which-Key](https://github.com/folke/which-key.nvim) so you never forget
  your keybindings.
- Super configurable (view [here](#configu) for more info).
- Already comes with dozens of builtin stuff (view
  [here](https://github.com/SingularisArt/DeathVim/wiki/Builtin) for more
  info).
- Comes with a simple, intuitive config file (view [here](#config-file) for
  more info).

# Installation

> :warning: You need the latest neovim version, which currently is 0.8. If you
> don't have or don't want to have the latest version, then go
> [here](#installing-the-latest-stable-version).

## Installing the Latest Version

```sh
bash <(curl -s https://raw.githubusercontent.com/SingularisArt/DeathVim/installation/installer.sh) --nightly
```

## Installing the Latest Stable Version

```sh
bash <(curl -s https://raw.githubusercontent.com/SingularisArt/DeathVim/installation/installer.sh) --stable
```

## Installing a specific Version

```sh
bash <(curl -s https://raw.githubusercontent.com/SingularisArt/DeathVim/installation/installer.sh) --version 0.x
```

# Resources

- [Documentation](https://github/SingularisArt/DeathVim/wiki)
- [YouTube](https://www.youtube.com/channel/UCZlyhrxolHFdmMVPRhJK47Q)
- [Discord](https://discord.gg/hVGRvra2)
- [Twitter](https://twitter.com/SingularisArt)
- [Website](https://deathvim.github.io)

# Credit

Huge shoutout to the following people and organizations:

- [LunarVim](https://github.com/LunarVim/LunarVim): I used a ton of their code
  and their project structure. Without them, it would've probebly would've
  taken me 5 months to start this project.
- [Christian Chiarulli](https://github.com/ChristianChiarulli/): He inspired me
  to create this project with his NeoVim from Scratch and Making NeoVim an IDE
  series.
- [Gideon Wolfe](https://github.com/GideonWolfe): I also borrowed some of his
  code and his idea from his `vim.reaper` project.
- [Wincent](https://github.com/wincent): I got many ideas from his Vim/NeoVim
  configuration setup.
- [Sweet_Ad6090](https://www.reddit.com/user/Sweet_Ad6090/): He's the skilled
  man who created the logo for me. If you need any logo designing, he's your
  guy. Send him a message through reddit, and he's be happy to help you out.

<!-- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) -->
<!-- [venn.nvim](https://github.com/jbyuki/venn.nvim) -->
<!-- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) -->
<!-- [twilight.nvim](https://github.com/folke/twilight.nvim) -->
<!-- [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc) -->
<!-- [vim-grammarous](https://github.com/rhysd/vim-grammarous) -->
<!-- [vim-LanguageTool](https://github.com/dpelle/vim-LanguageTool) -->
<!-- [LanguageTool.nvim](https://github.com/vigoux/LanguageTool.nvim) -->
<!-- [vim-pencil](https://github.com/preservim/vim-pencil) -->
<!-- [HighStr.nvim](https://github.com/Pocco81/HighStr.nvim) -->
<!-- [lookatme](https://github.com/d0c-s4vage/lookatme) -->
