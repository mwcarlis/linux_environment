
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compilers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType python compiler pylint
"let g:pylint_onwrite = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoCommands
autocmd BufWritePre *.py :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
set nu

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/        /g

" Stop the stupid EX mode from hi-jacking my keys.
nnoremap Q <nop> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Column distance indicator
set colorcolumn=79

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current poisition
set ruler

"Height of command bar
set cmdheight=2

" Configure backspace to act correctly
set backspace=eol,start,indent
set whichwrap+=<>,h,l

" Ignore case when searching
set ignorecase

" When searching be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search iun modern browsers
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc anyway
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
autocmd FileType make setlocal noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 8 spaces
set shiftwidth=4
set tabstop=4
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal tabstop=4


" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines




" ####  EOF  ####
