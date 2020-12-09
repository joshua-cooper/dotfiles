let mapleader = ' '
let g:plug_window = 'enew'
let g:gruvbox_italic = 1
let g:tokyonight_style = 'night'
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
let g:fzf_preview_window = ''
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'joshdick/onedark.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive', { 'on': 'Git' }
Plug 'justinmk/vim-dirvish'
Plug 'editorconfig/editorconfig-vim'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript.tsx' }
call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set termguicolors
set mouse=a
set hidden
set undofile
set lazyredraw
set noruler
set noshowmode
set noshowcmd
set number relativenumber
set expandtab shiftwidth=2 tabstop=8 softtabstop=-1
set incsearch ignorecase smartcase
set inccommand=nosplit
set splitright splitbelow
set nowrap
set list
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set statusline=%f%(\ %h%m%r%)%<%=%p%%\ %l:%c

silent! colorscheme gruvbox

function! s:new_file()
  let file = input('File: ')
  if len(file) > 0
    execute 'edit' expand('%:p:h') . '/' . file
  endif
endfunction

function! s:new_dir()
  let dir = input('Dir: ')
  if len(dir) > 0
    let path = expand('%:p:h') . '/' . dir
    execute 'silent !mkdir -p ' . path
    if v:shell_error
      echohl ErrorMsg
      echomsg 'Failed to create directory'
      echohl None
    else
      execute 'edit' path
    endif
  endif
endfunction

function! s:files(...)
  let root = get(a:, 1, '.')
  call fzf#run(fzf#wrap({
        \ 'source': 'fd -tf -H --exclude .git',
        \ 'sink': 'e',
        \ 'options': '--prompt "Files> "',
        \ 'dir': root,
        \ }))
endfunction

function! s:dirs(...)
  let root = get(a:, 1, '.')
  call fzf#run(fzf#wrap({
        \ 'source': 'fd -td -H --exclude .git',
        \ 'sink': 'e',
        \ 'options': '--prompt "Dirs> "',
        \ 'dir': root,
        \ }))
endfunction

command! NewFile call s:new_file()
command! NewDir call s:new_dir()
command! -nargs=? -complete=dir Files call s:files(<q-args>)
command! -nargs=? -complete=dir Dirs call s:dirs(<q-args>)

function! s:goyo_enter()
  set nolist
endfunction

function! s:goyo_leave()
  set list
endfunction

autocmd! User GoyoEnter nested call <sid>goyo_enter()
autocmd! User GoyoLeave nested call <sid>goyo_leave()

inoremap <silent><c-l> <c-o>:noh<cr>
nnoremap <silent><c-l> :noh<cr>
nnoremap <silent><leader>s :w<cr>
nnoremap <silent><leader>k :bd<cr>
nnoremap <silent><leader>K :bd!<cr>
nnoremap <silent><leader>q :qa<cr>
nnoremap <silent><leader>Q :qa!<cr>
nnoremap <silent><leader><tab> :b#<cr>
nnoremap <silent><leader>n :cnext<cr>
nnoremap <silent><leader>N :cprevious<cr>
nnoremap <silent><leader>r :execute 'edit' getcwd()<cr>
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>F :NewFile<cr>
nnoremap <silent><leader>d :Dirs<cr>
nnoremap <silent><leader>D :NewDir<cr>
nnoremap <silent><leader>g :Goyo<cr>
nnoremap <silent><leader>G :Git<cr>
nnoremap <leader><leader> @@zz

autocmd BufEnter * silent! setlocal syntax=on
autocmd BufLeave * silent! setlocal syntax=off

autocmd BufRead,BufNewFile *.svx set filetype=markdown
