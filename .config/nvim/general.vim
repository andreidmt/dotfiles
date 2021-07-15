syntax enable           " Syntax highlighting
set showmatch           " Show matching brackets.

set title               " Set window title.
set noshowmode          " Mode already shown in status bar

set pumheight=10        " Makes popup menu smaller


set iskeyword+=-        " Treat dash separated words as a word text object"
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.


set gdefault            " Use 'g' flag by default with :s/foo/bar/.

set nostartofline       " Do not jump to first character with page commands.

set nospell spelllang=en_us
set wildignore+=*node_modules/**,*dist/**
set virtualedit=block   " Allow going beyond the end of line in V-BLOCK

highlight Comment cterm=italic
highlight clear SignColumn

" Wraping
set colorcolumn=80      " Highlight ruler column
set wrap                " Wrap visually, don't change text in buffer.
set linebreak           " Only wrap at a character in the breakat 
                        " (" ^I!@*-+;:,./?").

" Ruler and position
set number              " Line numbers
set ruler		            " Show the cursor position all the time
set cursorline          " Highlight the screen line of the cursor
set so=5                " Scroll lines above/below cursor

" File
set encoding=utf-8      " The encoding displayed
set ffs=unix,dos,mac    " Unix as standard file type
set fileencoding=utf-8  " The encoding written to file
set backupcopy=yes      " Make a copy of the file and overwrite the original
set updatetime=100      " Write to swap file time

" Tab stuff
set tabstop=2           " Number of spaces to insert a tab
set softtabstop=2
set shiftwidth=2        " Number of space characters inserted for indentation
set smarttab            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab           " Converts tabs to spaces
set autoindent          " Copy indent from current line when starting new line
set smartindent         " Makes indenting smart :))

" Folding
set foldmethod=syntax " syntax highlighting items specify folds  
set foldcolumn=1      " defines 1 col at window left, to indicate folding  
let javascript_fold=1 " activate folding by JS syntax  
let typescript_fold=1 " activate folding by JS syntax  
set foldlevelstart=99 " start file with all folds opened

" Filetype association 
au BufRead,BufNewFile *.js.flow set filetype=javascript
au BufRead,BufNewFile *.flow set filetype=javascript
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile .*rc set filetype=json
au BufRead,BufNewFile .zshrc set filetype=zsh
au BufRead,BufNewFile .xinitrc set filetype=bash
