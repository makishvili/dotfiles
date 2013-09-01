set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'corntrace/bufexplorer'
Bundle 'matchit.zip'
Bundle 'bkad/CamelCaseMotion'
Bundle 'Marks-Browser'
Bundle 'JavaScript-syntax'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'tarmolov/snipmate-snippets.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tarmolov/TabLineNumbers.vim'
Bundle 'MediaWiki-folding-and-syntax-highlight'
Bundle 'mileszs/ack.vim'

let g:TabLineSet_windows = 0
let NERDTreeShowHidden = 1
"set autochdir
let g:NERDTreeChDirMode=2

" Common
syntax on
filetype plugin on
autocmd BufNewFile,BufRead *.test.js set filetype=javascript-jasmine syntax=javascript
autocmd BufNewFile,BufRead *.wiki set filetype=wiki syntax=wp
" autocmd vimenter * NERDTree       " autostart nerdtree
set langmenu=none                   " use english menu
set hidden                          " don't unload buffer before switching
set autoread                        " autoread changing of file
set spelllang=ru_ru,en_us           " spellchecker for english and russian
set history=150                     " size of history
set undolevels=1000                 " max count of undo commands
set nobackup                        " don't make backup
set noswapfile                      " and swap
set nowb
set confirm                         " provide confirm when you have unsaved changes
set path=.,,**                      " for recursive search

" Encoding
set encoding=utf8
set fileencoding=utf8
set termencoding=utf-8
set fileencodings=utf8,cp1251

" Input
set iminsert=0                      " english as default keyboard layout
let mapleader = ","                 " remap <Leader> key
set completeopt=longest,menuone     " autocompletion
set autoindent                      " inherit indent from previous line
"set smartindent
set formatoptions-=o                "dont continue comments when pushing o/O
set expandtab                       " convert tab to spaces
set shiftwidth=4                    " size of tab char in spaces
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start      " allow to use backspace instead of "x"
set fo+=cr                          " fix <Enter> for comment
autocmd BufWritePre * :%s/\s\+$//e  " Delete spaces from end on lines
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$## " Delete trailing lines at the end of file
autocmd FocusLost * silent! wh      " Auto save files when focus is lost
autocmd BufLeave * silent! :w       "   or leave buffer
set pastetoggle=<Leader>p           " Invert paste mod

" View
set title                           " show file name in window title
set ruler                           " show cursor position
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set mousehide                       " hide mouser corse in typing
"set cursorline                      " highlight current position of cursor
set number                          " enable row numeration
let &sbr = nr2char(8618).' '        " show ↪ at the beginning of wrapped lines
set list listchars=tab:▸\ ,trail:·,extends:→,precedes:←,nbsp:×
set background=dark

"highlight OverLengthLongLongStrings ctermbg=red ctermfg=white guibg=#592929
"match OverLengthLongLongStrings /\%101v.\+/

" Command line
set wildmenu                        " show autocompleate words
set showmatch                       " show matched paranthes

" Status bar
set showcmd                         " show unfinished commands
set laststatus=2                    " status bar alwais is visible
set statusline=%<%F\ %2*%y%m%r\
            \ %1*Line:\ %2*%l/%L[%P]\
            \ %1*Col:\ %2*%c\
            \ %=\
            \%0*[#%2*%n%0*]\
            \%3*-%{&fileencoding}-

" Folding
set foldlevelstart=99               "remove folds
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" Search
set incsearch                       " search when typing
set nohlsearch                      " disable highligting of found text
set ignorecase                      " search withoug casesensitive

" Sessions
"set sessionoptions=curdir,buffers,folds,tabpages,winpos,winsize,resize,help
"set sessionoptions+=unix,slash      " comfortable movement files from unix to windows

" < & > - shift for code blocks
vmap < <gv
vmap > >gv

" remap for CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b

" gf opens file in new tab
map <silent> gf <C-W>gf:tabm 999<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Replace
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>

" Marks browser
map <leader>mb :MarksBrowser<cr>

" Split navigation using arrows
"nnoremap <Right> <C-w>l
"nnoremap <Left> <C-w>h
"nnoremap <Up> <C-w>k
"nnoremap <Down> <C-w>j

" It's 2011. Don't skip wrap lines
noremap j gj
noremap k gk

" Acronyms
ab fucntion function
ab retrun return

" write file with sudo rules
" command! -nargs=0 -bang WSudo :silent! w !sudo tee % &>/dev/null

" map cyrillic symbols to  english
map —ë `
map –π q
map —Ü w
map —É e
map –∫ r
map –µ t
map –Ω y
map –≥ u
map —à i
map —â o
map –∑ p
map —Ö [
map —ä ]
map —Ñ a
map —ã s
map –≤ d
map –∞ f
map –ø g
map —Ä h
map –æ j
map –ª k
map –¥ l
map –∂ ;
map —ç '
map —è z
map —á x
map —Å c
map –º v
map –∏ b
map —Ç n
map —å m
map –± ,
map —é .
map –Å ~
map –ô Q
map –¶ W
map –£ E
map –ö R
map –ï T
map –ù Y
map –ì U
map –® I
map –© O
map –ó P
map –• {
map –™ }
map –§ A
map –´ S
map –í D
map –ê F
map –ü G
map –† H
map –û J
map –õ K
map –î L
map –ñ :
map –≠ "
map –Ø Z
map –ß X
map –° C
map –ú V
map –ò B
map –¢ N
map –¨ M
map –ë <
map –Æ >
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
