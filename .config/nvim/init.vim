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
Plug 'machakann/vim-highlightedyank'

" Fuzzy finding / navigation
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'Chiel92/vim-autoformat'
Plug 'chriskempson/base16-vim'

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

autocmd FileType json
	\ setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ====================================
" # HOTKEYS
" ====================================
" Open files/buffers
let $FZF_DEFAULT_COMMAND = 'rg --files'
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

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
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

set updatetime=300

set shortmess+=c
set signcolumn=yes

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

" Use left & right arrow keys to switch vertical splits
nnoremap <left> <C-w><left>
nnoremap <right> <C-w><right>

" Use Shift+left, Shift+right, Ctrl-left & Ctrl-right to resize vertical splits
nnoremap <S-left> <C-w><
nnoremap <S-right> <C-w>>
nnoremap <C-left> 10<C-w><
nnoremap <C-right> 10<C-w>>

" Move up/down by line
nnoremap j gj
nnoremap k gk

" Insert a new line without entering insert mode
nmap oo o<Esc>
nmap OO O<Esc>

" Toggle buffers
nnoremap <leader><leader> <c-^>

" Use tab for completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use Ctrl+Space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Go-tos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" Format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s)
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" ====================================
" # THEMING
" ====================================
if !has('gui_running')
	set t_Co=256
endif
colorscheme base16-gruvbox-dark-hard
set termguicolors
