source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/lsp.lua

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugin.gruvbox-material.vim
source $HOME/.config/nvim/plugin.galaxyline.lua
source $HOME/.config/nvim/plugin.treesitting.lua
source $HOME/.config/nvim/plugin.lspinstall.lua
source $HOME/.config/nvim/plugin.compe.lua


" Auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %      

"
" Note system
"

au BufWritePost *note-*.md silent !notes build %:p

" 
" Filetype association 
"

au BufRead,BufNewFile *.js.flow set filetype=javascript
au BufRead,BufNewFile *.flow set filetype=javascript
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile .*rc set filetype=json
au BufRead,BufNewFile .zshrc set filetype=zsh
au BufRead,BufNewFile .xinitrc set filetype=bash

"
" Key bindings
"

" run macro in q and w registers
nnoremap <LEADER>q @q            " current line
nnoremap <LEADER>w @w            " current line
vnoremap <LEADER>q :norm! @q<CR> " selected lines
vnoremap <LEADER>w :norm! @w<CR> " selected lines

" surround current word
nnoremap <LEADER>_ bi_<Esc>ea_
nnoremap <LEADER>" bi"<Esc>ea"
nnoremap <LEADER>* bi**<Esc>ea**
nnoremap <LEADER>( bi(<Esc>ea)
nnoremap <LEADER>[ bi[<Esc>ea]
nnoremap <LEADER>{ bi{<Esc>ea}

" surround selection
vnoremap <LEADER>_ c__<Esc>P
vnoremap <LEADER>" c""<Esc>P
vnoremap <LEADER>* c****<Esc>hP
vnoremap <LEADER>( c()<Esc>P
vnoremap <LEADER>[ c[]<Esc>P
vnoremap <LEADER>{ c{}<Esc>P

" markdown
nnoremap <LEADER>l ^i* <Esc>j
nnoremap <LEADER>o ^i1. <Esc>j

nnoremap <LEADER>d =strftime('%Y-%m-%d_%H:%M:%S')<CR>
nnoremap <LEADER>i :ALEDetail<CR>

nnoremap <LEADER>T :GenTocGFM<CR>

" yank/paste from/to +,* registers
nnoremap <LEADER>p "+p<CR>
nnoremap <LEADER>P "*p<CR>
vnoremap <LEADER>y "+y<CR>

" move through splits with Alt
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" auto fix prev/next spelling error without changing position
" https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <LEADER>s mm[s1z=`m<CR>
nnoremap <LEADER>S mm]s1z=`m<CR>

map <F1> :NERDTreeFind<CR>
map <F2> :TagbarOpen<CR>
map <C-f> :Rg<CR>
map <C-p> :Files<CR>

nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)

"
" Config Plugins
"

" SML
let g:sml_smlnj_executable = '/usr/bin/smlnj'

" Neosnippet 
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Codi scratchpad

let g:codi = {
\  'virtual_text': 0,
\  'rightalign': 1,
\  'rightsplit': 1
\ }

let g:codi#interpreters = {
\   'javascript': {
\     'bin': ['node', '--experimental-repl-await']
\   },
\ }

let g:codi#aliases = {
\  'javascript.jsx': 'javascript'
\ }

" Latex

let g:livepreview_previewer = 'zathura'


" Vim move
let g:move_map_keys = 0

vmap <A-[> <Plug>MoveBlockUp
vmap <A-]> <Plug>MoveBlockDown
"
" JS file auto import
let g:js_file_import_string_quote='"'
let g:js_file_import_omit_semicolon = 1
let g:js_file_import_no_mappings = 1

nmap <LEADER>g <Plug>(JsGotoDefinition)
nmap <LEADER>f <Plug>(JsFixImport)

" Neosnippet
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Note: It must be "imap" and "smap". It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" File browser
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
\   "Modified"  : "*",
\   "Staged"    : "+",
\   "Untracked" : "✭",
\   "Renamed"   : "->",
\   "Unmerged"  : "=",
\   "Deleted"   : "X",
\   "Dirty"     : "*",
\   "Clean"     : "✔︎",
\   "Ignored"   : '!',
\   "Unknown"   : "?"
\ }

" Default file browser
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Markdown preview
let g:mkdp_browser = 'surf'

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
\       'colorscheme': 'gruvbox'
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
let g:ale_lint_delay = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%][%code%] %severity%: %s'
let g:ale_linters = {
\  'sh': ['shellcheck'],
\  'dart': ['dartanalyzer'],
\  'scala': ['scalac'],
\  'typescript': ['eslint', 'tsserver'],
\  'typescriptreact': ['eslint', 'tsserver'],
\  'c': ['gcc'],
\  'css': ['stylelint'],
\  'javascript': ['eslint', 'tsserver'],
\  'sml': ['smlnj'],
\  'json': ['eslint'],
\  'markdown': ['markdownlint']
\ }
let g:ale_fixers = {
\  'dart': ['dartfmt'],
\  'typescript': ['eslint'],
\  'typescriptreact': ['eslint'],
\  'c': ['clang-format'],
\  'css': ['stylelint'],
\  'javascript': ['eslint'],
\  'html': ['eslint'],
\  'json': ['eslint']
\ }
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

let g:ale_typescript_eslint_use_global = 1
let g:ale_typescript_eslint_executable = 'eslint_d'

" Deoplete autocomplete
"call deoplete#custom#option({
"\ 'auto_refresh_delay': 10,
"\ 'camel_case': v:true,
"\ 'skip_multibyte': v:true,
"\ 'auto_preview': v:true,
"\ })

"call deoplete#custom#option('num_processes', 4)

"let g:deoplete#enable_at_startup = 1

"" Whether to include the types of the completions in the result data.
"" Default: 0
"let g:deoplete#sources#ternjs#types = 1

"" Whether to include documentation strings (if found) in the result data.
"" Default: 0
"let g:deoplete#sources#ternjs#docs = 1

""Add extra filetypes
"let g:deoplete#sources#ternjs#filetypes = [
"\ 'jsx',
"\ 'javascript.jsx',
"\ ]

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:tagbar_type_javascript = {
\  'ctagstype': 'javascript',
\  'kinds': [
\    'A:arrays',
\    'P:properties',
\    'T:tags',
\    'O:objects',
\    'G:generator functions',
\    'F:functions',
\    'C:constructors/classes',
\    'M:methods',
\    'V:variables',
\    'I:imports',
\    'E:exports',
\    'S:styled components'
\  ]
\ }

nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>
