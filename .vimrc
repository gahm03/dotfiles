"""" First, install $ git clone https://github.com/gmarik/Vundle.vim.git
"					~/.vim/bundle/Vundle.vim
" Setting up Vim
" ==================================
" 	       General	
" ==================================

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


"""""""""""""""""""""""""""""""Vundle"""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" required, don't pretend you're your old Vi
filetype plugin on  " required, for file browsing
syntax enable       " switch syntax highlighting on









" set the runtime path to include Vundle and initilalize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~./some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" =======================================================================
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'flazz/vim-colorschemes'
Plugin 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim/'}
Plugin 'TerryMa/vim-multiple-cursors'
Plugin 'luochen1990/rainbow'


let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'vim': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \		},
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'css': 0,
            \	}
            \}


Plugin 'ervandew/supertab'


" =======================================================================
" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on 	" required

" :PluginInstall to install plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""









" FINDING FILES
set path+=**    " Search down into folders   :find
set wildmenu    " Display all matching files when we tab complete
                " :ls list vim files
                " :b choose the file to change, menas buffer command
" AUTOCOMPLETE
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for just this file
" - ^x^f for filenames (work with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
"
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list
"
"
"
"
" SNIPPETS
" Read an empty template and move the cursor
nnoremap ,def :-1read ~/.vim/templates/defpy.py<CR>wi
        " n normalmode
        " noremap don't let any these commands invoke themselves
        " don't invoke the use of normal function of keys
        " : command mode
        " -1read changes the line by one 
        " then reads the file and press return key <CR> and return normal mode
        " then vim moves one word and go to insert mode
        "
nnoremap ,class :-1read ~/.vim/templates/classpy.py<CR>wi

nnoremap ,tex :-1read ~/.vim/templates/textemplate.tex<CR>jj3wcaw

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

set encoding=utf-8
let base16colorspace=256    " Acces colors present in 256 colorspace
set t_Co=256        " Explicitly tell vim that the terminal supports 256 colors
set background=dark
colorscheme badwolf "molokai "solarized " wombat256 "molokai "onedark "SlateDark 

" Better copy & paste
" When you want to paste large blocks fo code into vim, press F2 before
" paste. At the bottom you should see ''-- INSERT (paste) --''.
set pastetoggle=<F2>
set clipboard=unnamedplus
set ttyfast     " faster redrawing

" Mouse and backspace
set mouse=a " on OSX press ALT and click
set bs=2    " make backspace behave like normal

" Rebind <Leader> key
" I like to have it here because it is easier to reach than the default and 
" it is next to ''m'' and ''n'' which I use for navigating between tabs.
let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:udpate<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " quit current window
noremap <Leader>E :qa!<CR>  " quit all windows

" Showing line numbers and length
set number	" show line numbers
set tw=79	" width of document (used by gd)
set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap text when typing
set colorcolumn=80 
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set smarttab    " tab respect 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4   " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters width
set shiftwidth=4  " number of spaces to use for indent and unindent
set shiftround  " round indent to a multiple of 'shiftwidth'
set autoindent  " automatically set indent of a new line
set smartindent
set expandtab

" Disable stupid backup and swap files - they trigger to many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Code folding setting
set foldmethod=syntax   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1

set magic       " set magic for regex
set showmatch   " show matching braces
set mat=2       " how many tenths of a second to blink
set laststatus=2 " show status line all the time

set wrap        "breaks one line into multiple lines
