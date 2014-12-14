execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

"<NUL> is ctrl-space
noremap <silent> <NUL> <esc>
inoremap <silent> <NUL> <esc>
cnoremap <silent> <NUL> <esc>
cnoremap <C-a> <home>
cnoremap <C-e> <end>

set t_Co=256
set background=dark
"let g:solarized_termcolors=256
colorschem solarized

set cursorline

set ls=2

set ai
set ts=2
set sw=2
set softtabstop=2
set expandtab
set ruler
set number
set relativenumber
set incsearch
set colorcolumn=81,121

set cpoptions+=$

set path=,.,*/,*/**,./**


let g:airline_powerline_fonts=1

"mark configs
highlight MarkWord1 ctermbg=3 ctermfg=8 cterm=bold
highlight MarkWord2 ctermbg=13 ctermfg=8 cterm=bold
highlight MarkWord3 ctermbg=1 ctermfg=8 cterm=bold
highlight MarkWord4 ctermbg=6 ctermfg=8 cterm=bold
highlight MarkWord5 ctermbg=9 ctermfg=8 cterm=bold
highlight MarkWord6 ctermbg=2 ctermfg=8 cterm=bold
highlight MarkWord7 ctermbg=5 ctermfg=8 cterm=bold
highlight MarkWord8 ctermbg=4 ctermfg=8 cterm=bold

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" make tab completion for files/buffers act like bash
set wildmenu

if !empty($TMUX)
  :autocmd BufWritePost *.py silent ![[ `tmux display-message -p "\#{window_name}\#{window_panes}"` == "TDD2" ]] && tmux send-keys -t :.+ "run-tests" Enter
endif
