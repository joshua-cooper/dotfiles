" TODO: allow custom dir
command! -bang -nargs=? -complete=dir Files call fzf#run(fzf#wrap({ 'source': 'fd -tf -H --exclude .git' }, <bang>0))
command! -bang -nargs=?  -complete=dir Dirs call fzf#run(fzf#wrap({ 'source': 'fd -td -H --exclude .git' }, <bang>0))
