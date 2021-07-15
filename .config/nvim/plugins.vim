call plug#begin(stdpath('data') . '/plugged')

" Core
Plug 'dense-analysis/ale'     	   " Linter manager
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'   	   " Toggle comments
Plug 'jremmen/vim-ripgrep'    	   " Search in files
Plug 'matze/vim-move'              " Move multiple selected lines

Plug 'scrooloose/nerdtree'         " File browser
Plug 'Xuyuanp/nerdtree-git-plugin' " Git info 

" Color schemes
Plug 'sainnhe/gruvbox-material'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
" Plug 'carlitux/deoplete-ternjs'
" Plug 'zchee/deoplete-clang'

" Status bar
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'

" Templates & snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'


" Javascript
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc', { 
\  'for': ['javascript', 'javascript.jsx','typescript'], 
\  'do': 'make install'
\}
Plug 'mxw/vim-jsx'                  " JSX syntax
Plug 'metakirby5/codi.vim'          " Sketchpad
Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax

" 
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" SML
Plug 'jez/vim-better-sml'

" Markdown
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Other
Plug 'rstacruz/vim-closer'  " Auto close {,[,(
Plug 'dag/vim-fish'         " Fish syntax
Plug 'stevearc/vim-arduino' " Compile, uploade, and debugg arduino sketches
Plug 'gyim/vim-boxdraw'     " Draw ASCII boxes

" Expendable
Plug 'tpope/vim-sensible'     " 
Plug 'tpope/vim-unimpaired'   " 
Plug 'tpope/vim-characterize' " 
Plug 'tpope/vim-fugitive'     " git commands
Plug 'airblade/vim-gitgutter' " git diff info in buffer gutter
Plug 'ap/vim-css-color'       " color highlighting in css files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy file finder
Plug 'wellle/targets.vim'     " 
Plug 'godlygeek/tabular'      " 

call plug#end()
