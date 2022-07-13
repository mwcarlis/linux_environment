""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'nathanalderson/yang.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
""""" Plugin 'L9'
" Git plugin not hosted on GitHub
""""" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""""" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compilers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType python compiler pylint
"let g:pylint_onwrite = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoCommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove Trailiing Whitespace.
"autocmd BufWritePre *.py :%s/\s\+$//e
"autocmd BufWritePre *.cpp :%s/\s\+$//e
"autocmd BufWritePre *.c :%s/\s\+$//e
"autocmd BufWritePre *.h :%s/\s\+$//e
"
" Name the tmux window after the file.
" from: https://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim
"autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%")) " full path
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t")) " file name
autocmd VimLeave * call system("tmux rename-window bash")

" Enable Syntax highlighting with C++ 11 Style.
au BufNewFile,BufRead *.cpp syntax on
au BufNewFile,BufRead *.h syntax on
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.h set syntax=cpp11

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
autocmd FileType c setlocal noexpandtab
"autocmd FileType cpp setlocal noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 8 spaces
set shiftwidth=8
set tabstop=8

autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal tabstop=4

autocmd FileType c setlocal shiftwidth=8
autocmd FileType c setlocal tabstop=8
autocmd FileType cpp setlocal shiftwidth=8
autocmd FileType cpp setlocal tabstop=8

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines




" ####  EOF  ####
