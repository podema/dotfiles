set nocompatible
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi
set clipboard=unnamedplus

"plugins
filetype off 
let g:tex_flavor='latex'

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
"Plugin 'gcmt/breeze.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'The-NERD-tree'
Plugin 'xuhdev/SingleCompile'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/AutoClose'
Plugin 'marijnh/tern_for_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
colorscheme jellybeans
"custom maps
map <F2> :w<CR>
map <F3> :wq<CR>
map <F4> :q!<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :bookmark
map <F8> :Errors<CR>
map <C-i> gg=G
nmap <F9> :SCCompileRunAsync<CR>
nmap <F10> :SCViewResultAsync<CR>
map C-H C-e,<CR>
let g:user_emmet_leader_key="<C-e>"

"Syntastic
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }
" Better :sign interface symbols
 let g:syntastic_error_symbol = 'x'
 let g:syntastic_warning_symbol = '!'
 "Use flake8
 let g:syntastic_python_checkers = ['flake8']
 let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
" Use jshint (uses ~/.jshintrc)
 let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_latex_heckers = ['chktex']
"Snippets
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-e>"
" " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"


"completion
let g:ycm_key_list_select_completion = ['<C-j>','<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>','<Up>']




""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

"" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
 set mouse=a
endif

" do not history when leavy buffer
set hidden

" FIXME: (broken) ctrl s to save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode 
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Find
map <C-f> /
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> "+d
vmap <C-v> "+p
vmap <C-c> "+y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

" lazy ':'
map \ :

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
