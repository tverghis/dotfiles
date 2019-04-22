" .vimrc closely mimics @jonhoo's configuration.
" I've cherry-picked the most useful pieces for myself, and reorganized
" them to make sense to me.

" ====================================
" # GENERAL
" ====================================
let mapleader = "\<Space>"
set vb t_vb=			" Supress beeps
set ttyfast
set lazyredraw
set laststatus=2
set relativenumber
set number
set showcmd

" ====================================
" # PLUGINS
" ====================================
set nocompatible
filetype off

call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'

" Fuzzy finding / navigation
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language support
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Completion plugins
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Syntax support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'

Plug 'jiangmiao/auto-pairs'

Plug 'Chiel92/vim-autoformat'

call plug#end()

" ====================================
" # PLUGIN CONFIGURATION
" ====================================
" Lightline
let g:lightline = {
			\ 'component_function': {
			\	'filename': 'LightlineFileName',
			\},
			\}
function! LightlineFileName()
	return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Linter settings - only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

" ncm2 Completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Language server
let g:LanguageClient_serverCommands = {
			\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
			\ 'javascript': ['javascript-typescript-stdio'],
			\}
let g:LanguageClientClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Improve errors
let g:LanguageClient_diagnosticsDisplay = {
			\     1: {
			\         "name": "Error",
			\         "texthl": "ALEError",
			\         "signText": "✖",
			\         "signTexthl": "ErrorMsg",
			\         "virtualTexthl": "WarningMsg",
			\     },
			\     2: {
			\         "name": "Warning",
			\         "texthl": "ALEWarning",
			\         "signText": "⚠",
			\         "signTexthl": "ALEWarningSign",
			\         "virtualTexthl": "Todo",
			\     },
			\     3: {
			\         "name": "Information",
			\         "texthl": "ALEInfo",
			\         "signText": "ℹ",
			\         "signTexthl": "ALEInfoSign",
			\         "virtualTexthl": "Todo",
			\     },
			\     4: {
			\         "name": "Hint",
			\         "texthl": "ALEInfo",
			\         "signText": "➤",
			\         "signTexthl": "ALEInfoSign",
			\         "virtualTexthl": "Todo",
			\     },
			\ }

" Rustfmt
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_faily_silently = 0

" ====================================
" # FORMATTING
" ====================================
noremap <F3> :Autoformat<CR>

autocmd BufWrite *.c,*.h :Autoformat

autocmd FileType c
	\ setlocal tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType js
	\ setlocal tabstop=4 softtabstop=4 shiftwidth=4

" ====================================
" # HOTKEYS
" ====================================
" Open files/buffers
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Jump to ALE errors
nmap <silent> <leader>n :ALENext<CR>
nmap <silent> <leader>m :ALEPrevious<CR>

" ====================================
" # EDITOR SETTINGS
" ====================================
filetype plugin indent on
set autoindent
set timeoutlen=300
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
set nofoldenable

set splitright
set splitbelow

syntax on

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault
set nohlsearch

" Center the search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

nnoremap ? ?\v
nnoremap / /\v

" ====================================
" # KEY MAPPINGS
" ====================================
" Map jk to Esc
inoremap jk <Esc>
vnoremap jk <Esc>

" Use home-row keys to travel to start/end of line
map H ^
map L $

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Use left & right arrow keys to switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move up/down by line
nnoremap j gj
nnoremap k gk

" Insert a new line without entering insert mode
nmap oo o<Esc>
nmap OO O<Esc>

" Toggle buffers
nnoremap <leader><leader> <c-^>

" ====================================
" # THEMING
" ====================================
if !has('gui_running')
	set t_Co=256
endif
let base16colorspace=256
set background=dark
colorscheme base16-atelier-dune
