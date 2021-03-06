filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
" Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'vim-scripts/DrawIt'
Plug 'terryma/vim-multiple-cursors'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'

" Plug 'will133/vim-dirdiff'

" Plug 'lilydjwg/fcitx.vim' "solve vim chinese input method
" Plug 'CodeFalling/fcitx-vim-osx'
" Plug 'plytophogy/vim-virtualenv'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --js-completer' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'Rykka/riv.vim'
" Plug 'maralla/completor.vim'
"Plug 'ternjs/tern_for_vim'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
" Plug 'fatih/vim-go'
"Plug 'ekalinin/Dockerfile.vim'

" Markdown Plugin
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'jszakmeister/markdown2ctags'

" code formatter

Plug 'altercation/vim-colors-solarized'

Plug 'christoomey/vim-tmux-navigator'

Plug 'bigfish02/vim-run-in-tmux'


call plug#end()

" set rtp+=~/.vim/plugged/potion
" exe 'set rtp+=' . expand('~/.vim/plugged/potion')

" set shell=bash\ -i
set encoding=utf-8
set fileencodings=utf-8,cp936,latin-1
set mouse+=a

" set fillchars+=vert:│
set fillchars=vert:\ 
" set fillchars=""
" hi clear VertSplit
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" map :w save file
" nnoremap <silent> <C-s> :w<cr>

set nu
set laststatus=2
set t_Co=256
colorscheme solarized
" colorscheme molokai
" colorscheme space-vim-dark
" color dracula

" let g:molokai_original = 1
" let g:rehash256=1
set background=dark
set clipboard=unnamed

" remove the left waves on nontext area
" set the background and foreground to the same color
highlight NonText ctermbg=8
highlight NonText ctermfg=8

" code fold
set foldmethod=indent
set foldlevelstart=99

" format code
" nmap <leader>= ggVG=<CR>

nmap <leader>Y "+y<CR>
nmap <leader>P "+p<CR>

"paste mode
"set pastetoggle=<leader>p

set hlsearch incsearch

"key mapping
let mapleader=","
nmap <leader>sv :source ~/.vimrc<CR>
nmap <leader>ev :tabedit ~/.vimrc<CR>
nmap <leader>G ggVG=<CR>
nmap <leader>pa :set paste!<CR>
nmap <leader><Space><Space> :%s/\s\+$//<cr>
nnoremap <leader>nu :set nu!<CR>
nnoremap <leader>hl :set hlsearch!<CR>
nmap <leader>nl :nohl<CR>
nnoremap <leader>is :set incsearch!<CR>
nnoremap <Leader>W :let @/=expand('<cword>')\|set hlsearch<C-M>


"jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

" Window resize
nnoremap <silent> <Leader>+ :res +5<CR>
nnoremap <silent> <Leader>- :res -5<CR>
nnoremap <silent> <Leader>> :vertical res -5<CR>
nnoremap <silent> <Leader>< :vertical res +5<CR>
" Window navigation function
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
" nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
" nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
" nnoremap <silent> <C-w>\ :TmuxNavigatePrevious<cr>
" nmap <C-k> <C-w>k
" nmap <C-j> <C-w>j
" nmap <C-h> <C-w>h
" nmap <C-l> <C-w>l

nnoremap <leader>bj   :bnext<CR>
nnoremap <leader>bk :bprevious<CR>

"NERDTree
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'
"when open a directory using vim, auto open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"when only NERDTree is open, it will auto closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"set NERDTree Width
let NERDTreeWinSize=25
"display hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']


"NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCOMPACTSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1
" let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '/** ', 'right': ' */' } }

"TagBar
map <leader>tt :TagbarToggle<CR>
" Add support for markdown files in tagbar.
" let g:tagbar_type_markdown = {
"             \ 'ctagstype': 'markdown',
"             \ 'ctagsbin' : '~/.vim/plugged/markdown2ctags/markdown2ctags.py',
"             \ 'ctagsargs' : '-f - --sort=yes',
"             \ 'kinds' : [
"             \ 's:sections',
"             \ 'i:images'
"             \ ],
"             \ 'sro' : '|',
"             \ 'kind2scope' : {
"             \ 's' : 'section',
"             \ },
"             \ 'sort': 0,
"             \ }

"ctrlp
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" vim-autoformat
" format your code
nnoremap <Leader>af :Autoformat<CR>

let g:formatter_yapf_style = 'pep8'
" let g:formatters_html = ['htmlbeautify']
" let g:formatdef_myeslint = '"eslint --fix"'
" let g:formatters_javascript = ['myeslint']

"YouCompleteMe
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_python_binary_path = 'python'
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>pc :pc<CR>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_open_loclist_on_ycm_diags = 1
" let g:ycm_global_ycm_extra_conf = '/root/.ycm_extra_conf.py'
"let g:ycm_always_populate_location_list = 1
" let g:ycm_python_binary_path = '/usr/local/bin/python2'

" vim-multiple-cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction

"ale
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" let g:airline#extensions#al#enabled = 1
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_echo_cursor = 1
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\ 'jsx': ['eslint'],
			\ 'html': ['htmlhint'],
			\ 'python': ['flake8'],
			\ 'c': ['gcc'],
			\}
let g:ale_javascript_eslint_executable = '/usr/local/bin/eslint'
let g:ale_javascript_eslint_options = '-c ~/work-on-terminal/eslintrc.js'
let g:ale_javascript_eslint_use_global = 1
" ale Python
let g:ale_python_flake8_executable = '/usr/local/bin/flake8'
let g:ale_python_flake8_use_global = 1

" nnoremap <leader>ap :let g:ale_python_flake8_executable = 'python2'<CR>

" auto-pair
" let g:AutoPairsFlyMode = 1

"Ack
"search code
"it is very faster
cnoreabbrev Ack Ack!
nnoremap <Leader>ag :Ack!<Space>
let g:ackhighlight=1 "highlight the searched term
"Integrate ag to Ack
let g:ackprg='ag --nogroup --nocolor --column'

" Run in tmux
nnoremap <Leader>ot :OpenTmuxPane 0 <CR>

nnoremap <Leader>rb :RitCommand 'bpython' 0<CR>
nnoremap <Leader>rn :RitCommand 'node' 0<CR>

" nnoremap <Leader>rp :RitCurrentFile python3 1<CR>
" nnoremap <Leader>rt :RitCurrentFile py.test 1<CR>

nnoremap <Leader>rj :RitCurrentFile node 1<CR>
nnoremap <Leader>rq :RitClose <CR>

nnoremap <Leader>rc :call RunCodeInTmux()<CR>
function! RunCodeInTmux()
	if &filetype == 'python'
		:RitCurrentFile python3 1<CR>
	endif
	if &filetype == 'java'
		:RitCurrentFile java 1<CR>
	endif
	if &filetype == 'lua'
		:RitCurrentFile lua 1<CR>
	endif
	if &filetype == 'javascript.jsx'
		:RitCurrentFile node 1<CR>
	endif
endfunction
" debug python code
nnoremap <Leader>db Oimport pdb<CR>pdb.set_trace()<Esc>

" nnoremap <Leader>dc :call DebugInTmux()<CR>
" function! DebugInTmux()
"     if &filetype == 'python'
"         :RitCurrentFile python3 1<CR>
"     endif
" endfunction

" vim-jsx
" let g:jsx_ext_required = 0

"vimwiki
" let g:vimwiki_list = [{'path': '~/my_site/',
"       \ 'syntax': 'markdown', 'ext': '.md'}]

"vim-gitgutter
" let g:gitgutter_signs = 0
" nnoremap <Leader>gr :GitGutterSignsToggle<CR>

"file indent
set tabstop=4
set shiftwidth=4

" comment use italic font
" highlight Comment cterm=italic

"python code indent
autocmd FileType python set expandtab softtabstop=4 shiftwidth=4 textwidth=79

" vim code indent
autocmd FileType vim set shiftwidth=4

"html css code indent
autocmd FileType html,css,less,scss,svg set tabstop=2 shiftwidth=2
"
"javascript code indent
autocmd FileType javascript,javascript.jsx,ts set expandtab tabstop=2 shiftwidth=2 softtabstop=2

"json file indent
autocmd FileType json set shiftwidth=4
"
"yaml file indent
autocmd FileType yaml set shiftwidth=2 tabstop=2

"C indent
autocmd FileType c,cpp set tabstop=4 shiftwidth=4 cindent
au BufRead,BufNewFile *.h set filetype=c

" markdown indent
autocmd FileType markdown set autoindent tabstop=4 shiftwidth=4
let g:vim_markdown_fenced_languages = ['js=javascript']

"解决backspace不能用的问题
set backspace=indent,eol,start

"自动切换fcitx 输入法
" set ttimeoutlen=100

" statusline config
hi statusline ctermbg=255
hi statusline ctermfg=23
hi statuslinenc ctermbg=244
hi statuslinenc ctermfg=23
set ruler
set statusline=%f                           " file name
set statusline+=\ %{strlen(&fenc)?&fenc:'none'} "file encoding
set statusline+=\ %y      "filetype
set statusline+=\ %=\ %l/%L\ (%p%%)\             "Rownumber/total (%)
set statusline+=\ col:%c\                            "Colnr

" 默认是 python3 允许环境
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
" function! RunCodeInTmux()
"     if &filetype == 'python'
"         :RitCurrentFile python2 1<CR>
"     endif
" endfunction
