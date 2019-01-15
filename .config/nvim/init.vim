filetype plugin indent on
" set switchbuf=usetab,newtab

set colorcolumn=80      " Highlight ruler column.
set wrap                " Wrap visually, dont change text in buffer.
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
set termguicolors       " Enable true colors 
set nostartofline       " Do not jump to first character with page commands.
set noshowmode          " Already shown in lightline
set background=dark

highlight Comment cterm=italic
highlight clear SignColumn

"
" Key bindings
"
map <F1> :NERDTreeFind<CR>
map <C-p> :FZF<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap ; :

"
" Treat as Javascript files
"
au BufRead,BufNewFile *.js.flow set filetype=javascript
au BufRead,BufNewFile *.flow set filetype=javascript
au BufRead,BufNewFile .babelrc set filetype=javascript
au BufRead,BufNewFile .eslintrc set filetype=javascript

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .' '
    let s .= (bufname != '' ? ''. fnamemodify(bufname, ':t') . ' ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  return s
endfunction
set tabline=%!Tabline()

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
Plug 'wellle/targets.vim'
Plug 'majutsushi/tagbar'

" languages
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx'

" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'ap/vim-css-color' " color hightlighting
Plug 'scrooloose/nerdtree' " file browser
Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-gitgutter' 
Plug 'w0rp/ale' " linter manager
Plug 'Shougo/deoplete.nvim' " autocomplete
Plug 'junegunn/fzf' " fuzzy finder
Plug 'drewtempelmeyer/palenight.vim' " color scheme

" Flow
" Plug 'carlosrocha/vim-flow-plus'
Plug 'steelsojka/deoplete-flow'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Other
Plug 'editorconfig/editorconfig-vim'

call plug#end()

"" 
"" Config Plugins
""

" Palenight Color Scheme
colorscheme palenight
let g:palenight_terminal_italics=1

" File browser
let NERDTreeShowHidden=1

" Default file browser
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Sitchyny/lightline.vim - Status bar
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

" w0rp/ale - Linter manager 
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 5
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%][%code%] %severity%: %s' 
let g:ale_linters = {
\   'javascript': ['eslint']
\ }
let g:ale_fixers = {
\    'javascript': ['eslint', 'prettier']
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
