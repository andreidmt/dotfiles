" filetype plugin indent on
" set switchbuf=usetab,newtab

set colorcolumn=80      " Highlight ruler column.
set wrap                " Wrap visually, don't change text in buffer.
set linebreak           " Only wrap at a character in the breakat 
                        " (" ^I!@*-+;:,./?").
set autoindent          " Copy indent from current line when starting new line.
set expandtab           " Insert mode: Use the appropriate number of spaces 
                        " to insert a tab.
set backupcopy=yes      " Make a copy of the file and overwrite the original.
set showmatch           " Show matching brackets.
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set title               " Set window title.
set nu                  " Print line numbers.
set updatetime=100      " Write to swap file time.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set rnu                 " Relative numbering from current line.
set nostartofline       " Do not jump to first character with page commands.
set noshowmode          " Already shown in lightline
set nospell spelllang=en_us

highlight Comment cterm=italic
highlight clear SignColumn

"
" Key bindings
"
let mapleader="\<SPACE>"

nnoremap <LEADER>d =strftime('%Y-%m-%d_%H:%M:%S')<CR>
nnoremap <LEADER>i :ALEDetail<CR>
nnoremap <LEADER>f :ALEFix<CR>

" yank/paste from/to + register
nnoremap <LEADER>p "+p<CR>
vnoremap <LEADER>y "+y<CR>

" move through splits with Alt
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" auto fix prev/next spelling error without changing position
" https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <LEADER>f mm[s1z=`m<CR>
nnoremap <LEADER>F mm]s1z=`m<CR>

map <F1> :NERDTreeFind<CR>
map <C-p> :FZF<CR>

nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)

"
" Treat as Javascript files
"
au BufRead,BufNewFile *.js.flow set filetype=javascript
au BufRead,BufNewFile *.flow set filetype=javascript
au BufRead,BufNewFile .prettierrc set filetype=javascript
au BufRead,BufNewFile .babelrc set filetype=javascript
au BufRead,BufNewFile .eslintrc set filetype=javascript

"" 
"" Load Plugins
""

call plug#begin('~/.local/share/nvim/plug.vim')

" vim
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " git commands
Plug 'airblade/vim-gitgutter' " git diff info in buffer gutter
Plug 'wellle/targets.vim'
Plug 'majutsushi/tagbar'
Plug 'ap/vim-css-color' " color highlighting
Plug 'w0rp/ale' " linter manager
Plug 'Shougo/deoplete.nvim' " autocomplete
Plug 'junegunn/fzf' " fuzzy finder
Plug 'jremmen/vim-ripgrep'

" Color schemes
Plug 'lifepillar/vim-solarized8'
Plug 'drewtempelmeyer/palenight.vim' 

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx'
Plug 'steelsojka/deoplete-flow'
Plug 'ternjs/tern_for_vim'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mzlogin/vim-markdown-toc'

" File browser
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin' " git info 

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Other
Plug 'editorconfig/editorconfig-vim'

call plug#end()

""
"" Color scheme
""

syntax enable
set background=light
colorscheme palenight " solarized8 
let g:solarized_term_italics = 1
set termguicolors

"" 
"" Config Plugins
""

" File browser
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
\       "Modified"  : "*",
\       "Staged"    : "+",
\       "Untracked" : "✭",
\       "Renamed"   : "->",
\       "Unmerged"  : "=",
\       "Deleted"   : "X",
\       "Dirty"     : "*",
\       "Clean"     : "✔︎",
\       "Ignored"   : '!',
\       "Unknown"   : "?"
\ }

" Default file browser
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Status bar
let g:lightline = {
\       'active': {
\               'right': [
\                       [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\                       [ 'percent', 'lineinfo' ],
\                       [ 'syntastic' ],
\                       [ 'fileformat', 'fileencoding', 'filetype' ],
\               ],
\       },
\       'component_expand': {
\               'linter_checking': 'lightline#ale#checking',
\               'linter_warnings': 'lightline#ale#warnings',
\               'linter_errors': 'lightline#ale#errors',
\               'linter_ok': 'lightline#ale#ok',
\       },
\       'component_type': {
\               'linter_checking': 'left',
\               'linter_warnings': 'warning',
\               'linter_errors': 'error',
\               'linter_ok': 'left',
\       },
\       'colorscheme': 'palenight'
\ }
let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_warnings = ''
let g:lightline#ale#indicator_errors = ''
let g:lightline#ale#indicator_ok = 'OK'

" panglossns/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Linter manager 
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 5
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%][%code%] %severity%: %s' 
let g:ale_linters = {
\       'javascript': ['eslint'],
\       'markdown': ['markdownlint']
\ }
let g:ale_fixers = {
\       'javascript': ['eslint']
\ }
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:flow_path = system('PATH=$PATH')

let g:tagbar_type_javascript = {
\       'ctagstype': 'javascript',
\       'kinds': [
\               'A:arrays',
\               'P:properties',
\               'T:tags',
\               'O:objects',
\               'G:generator functions',
\               'F:functions',
\               'C:constructors/classes',
\               'M:methods',
\               'V:variables',
\               'I:imports',
\               'E:exports',
\               'S:styled components'
\       ]
\ }
