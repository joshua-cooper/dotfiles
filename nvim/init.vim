let mapleader = " "
let g:plug_window = 'enew'
let g:fzf_preview_window = ''
let g:gruvbox_italic = 1

call plug#begin()
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'gruvbox-community/gruvbox'

" Language support
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dag/vim-fish', { 'for': 'fish' }
call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! colorscheme gruvbox

set termguicolors
set confirm
set mouse=a
set lazyredraw
set undofile
set hidden
set noruler
set noshowmode
set noshowcmd
set expandtab shiftwidth=2 tabstop=8 softtabstop=-1
set incsearch
set inccommand=nosplit
set splitright splitbelow
set list
set nowrap
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set statusline=%f%(\ %h%m%r%)%<%=%p%%\ %l:%c

inoremap <silent><c-l> <c-o>:noh<cr>
nnoremap <silent><c-l> :noh<cr>
nnoremap <silent><leader>q :qa<cr>
nnoremap <silent><leader>k :bd<cr>
nnoremap <silent><leader>s :w<cr>
nnoremap <silent><leader><tab> :b#<cr>
nnoremap <silent><leader>n :cnext<cr>
nnoremap <silent><leader>N :cprevious<cr>
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>d :Dirs<cr>
nnoremap <leader>F :edit %:p:h/
nnoremap <leader>D :Dir %:p:h/
nnoremap <silent><leader>r :execute 'edit' getcwd()<cr>
" nnoremap <tab> @@zz TODO: figure out a key for this
