# work on terminal

I enjoy working on terminal. Those tools I often used are vim, tmux, fish and ipython/bpython. It improves my productivity.

This repository includes all my configuration.


## Basic Usage

1. Get simple vimrc

```
wget https://raw.githubusercontent.com/bigfish02/work-on-terminal/master/vimrc_simple -O ~/.vimrc
```

2. Get my configuration for vim8, fish, tmux

```
git clone https://github.com/bigfish02/work-on-terminal.git ~/work-on-terminal
```

## vim8 setting

### Install

#### On Ubuntu

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

#### On Centos/Fefora

```
curl -L https://copr.fedorainfracloud.org/coprs/mcepl/vim8/repo/epel-7/mcepl-vim8-epel-7.repo -o /etc/yum.repos.d/mcepl-vim8-epel-7.repo
yum update vim* -y
yum install cmake gcc-c++ -y
```

#### On Arch

	sudo pacman -S vim

#### On Mac

	brew install vim --override-system-vim

### configuration file

```
ln -s ~/work-on-terminal/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

open vim, and execute `:PlugInstall` to install vim plugins.

### Plugins Introduce

+ Plug 'kien/ctrlp.vim'

	use <Ctrl-P> command to open files

+ Plug 'scrooloose/nerdtree'

	browse files in current directory

+ Plug 'majutsushi/tagbar'

	
+ Plug 'scrooloose/nerdcommenter'

	comment file

+ Plug 'mileszs/ack.vim'

	search file

+ Plug 'easymotion/vim-easymotion'

+ Plug 'mattn/emmet-vim'

	html complete

+ Plug 'tpope/vim-surround'
+ Plug 'jiangmiao/auto-pairs'

+ Plug 'vim-scripts/DrawIt'

	drap various of shapes in vim

+ Plug 'terryma/vim-multiple-cursors'

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

+ Plug 'w0rp/ale'

	code format check

"Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'lilydjwg/fcitx.vim' "solve vim chinese input method
" Plug 'CodeFalling/fcitx-vim-osx'
" Plug 'Valloric/YouCompleteMe'
" Plug 'davidhalter/jedi-vim'
" Plug 'maralla/completor.vim'
"Plug 'ternjs/tern_for_vim'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

+ Plug 'pangloss/vim-javascript'
+ Plug 'mxw/vim-jsx'

" Plug 'fatih/vim-go'
"Plug 'ekalinin/Dockerfile.vim'
" Plug 'benmills/vimux'

" Markdown Plugin
+ Plug 'godlygeek/tabular'
+ Plug 'plasticboy/vim-markdown'
+ Plug 'suan/vim-instant-markdown'

" code formatter
Plug 'Chiel92/vim-autoformat'

Plug 'altercation/vim-colors-solarized'

" Plug 'tpope/vim-fugitive'
"Plug 'Shougo/denite.nvim'
" Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'bigfish02/run-in-tmux', { 'dir': '~/.vim/plugged/run-in-tmux' }
+ Plug 'bigfish02/vim-run-in-tmux'

### code completion and syntax check

#### Javascript

1. code completion

Create a `.tern-project` file like follows in the root directory of your JavaScript project.

```
{
  "libs": [
    "browser",
    "jquery"
  ],
  "loadEagerly": [
    "importantfile.js"
  ],
  "plugins": {
    "requirejs": {
      "baseURL": "./",
      "paths": {}
    }
  }
}
```

2. syntax check

```
sudo npm install -g eslint
```

After install eslint globally, you should execute `eslint --init` to generate configuration file on your project.

3. 使用全局的 eslint 配置文件

You can also use the configuration file in home directory:

```
ln -sfv ~/work-on-terminal/.eslintrc.js ~/.eslintrc.js
yarn global add eslint-plugin-react
```

4. 安装相应的插件

```
npm install -g eslint-plugin-react
npm install -g babel-eslint
```

#### HTML

1. syntax check
	
		npm install -g htmllint

2. formatter

		npm install js-beautify -g

#### python

1. code completion

There is no additional configuration for Python completion and GoTo commands. It work out of the box.

2. syntax check

		pip install flake8

3. code formatter
	
		pip install yapf


#### c/c++

### 同步vim

由于自己经常在服务器上使用vim编程，但是内部服务器无法通过github来同步vim的配置。
为此采用的方法是将配置vim需要的文件进行打包。然后传到服务器端。

	cp ~/work-on-linux/vimrc ~/.vim/
	tar -zcf vim-config.tar.zip2 ~/.vim
	scp vim-config.tar.zip2 xx@xx.xx.xx.xx:/path/to
	tar -zxf vim-config.tar.zip2
	cp ~/.vim/vimrc ~/.vimrc

### INSTALL the_silver_searcher

**On ArchLinux**

	pacman -S the_silver_searcher

### Install ctags

	pacman -S ctags

Tagbar plugin needs ctags.

### code checking

1. javascript

	npm install eslint -g

## Fish

### install fish-shell and omf-fish

1. install fish shell

	sudo apt install fish
	sudo pacman install fish
	brew install fish

2. install oh-my-fish

		curl -L https://get.oh-my.fish | fish

3. change fish to default shell

**On Linux:**

	chsh -s /usr/bin/fish

**On Mac:**

	sudo vim /etc/shells

and add /usr/local/bin/fish

	chsh -s /usr/local/bin/fish

It take effects when you log in next time.

3. install fish theme

		omf install bobthefish

## tmux

### INSTALLATION

```
ln -sf ~/work-on-terminal/tmux.conf ~/.tmux.conf
```

### INSTALL TPM(Tmux Plugin Manager)

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

and then into tmux, execute `PREFIX` + I to install tmux plugin.

### enable tmux support italic fonts

touch a file as tmux-256color.terminfo with the following content:

```
# A screen-256color based TERMINFO that adds the escape sequences for italic.
# run to add to term db: tic tmux.terminfo
tmux|tmux terminal multiplexer,
  ritm=\E[23m, rmso=\E[27m, sitm=\E[3m, smso=\E[7m, Ms@,
    use=xterm, use=screen,
	
	tmux-256color|tmux with 256 colors,
	  use=xterm-256color, use=tmux,]]]]
```

Then `tic -c tmux-256color.terminfo`.

Then add the following line to `tmux.conf`:
	
	set -g default-terminal "tmux-256color"

## homebrew

配置homebrew使用国内的源

1. 替换brew.git:
cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

2. 替换homebrew-core.git:
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

3. 替换homebrew bottles源

**fish**:

vi ~/.config/fish/config.fish

set -x HOMEBREW_BOTTLE_DOMAIN http://7xkcej.dl1.z0.glb.clouddn.com

## pip

vim  ~/pip/.pip.conf (Windows 系统下是 c:\users\xx\pip.ini)

```
[global]
index-url = https://pypi.douban.com/simple
```
## python

```
brew install python
```

add the following to ~/.config/fish/config.fish

```
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
```

### virtualenv

pip install virtualfish

add the following to ~/.config/fish/config.fish to change prompt when source virtualenv.

```
eval (python2 -m virtualfish)
functions -c fish_prompt _old_fish_prompt
function fish_prompt
	if set -q VIRTUAL_ENV
		echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
	end
    _old_fish_prompt
end
```

### debug python

	pip3 install ipdb

When you need to debug python code, you just need input `python -m ipython xx.py` in terminal.
