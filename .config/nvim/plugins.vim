call plug#begin(stdpath('data') . '/plugged')

" Core
Plug 'dense-analysis/ale'     	   " Linter manager
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'   	   " Toggle comments
Plug 'matze/vim-move'              " Move multiple selected lines
Plug 'scrooloose/nerdtree'         " File browser
Plug 'Xuyuanp/nerdtree-git-plugin' " Git info 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder
Plug 'junegunn/fzf.vim'

" Cool
Plug 'gyim/vim-boxdraw'            " Draw ASCII boxes
Plug 'metakirby5/codi.vim'         " Sketchpad
Plug 'mzlogin/vim-markdown-toc'    " Auto Table of Contents based on Markdown Headings

" Color scheme
Plug 'sainnhe/gruvbox-material'

" Status bar
Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Languages
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Autocomplete
Plug 'hrsh7th/nvim-compe'

" Templates & snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" 
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'preservim/tagbar'

" Dart
" Plug 'dart-lang/dart-vim-plugin'

" SML
Plug 'jez/vim-better-sml'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Other
Plug 'rstacruz/vim-closer'  " Auto close {,[,(
" Plug 'dag/vim-fish'         " Fish syntax
Plug 'stevearc/vim-arduino' " Compile, uploade, and debugg arduino sketches

" Expendable
Plug 'tpope/vim-sensible'     " 
Plug 'tpope/vim-unimpaired'   " 
Plug 'tpope/vim-characterize' " 
Plug 'tpope/vim-fugitive'     " git commands
Plug 'airblade/vim-gitgutter' " git diff info in buffer gutter
Plug 'ap/vim-css-color'       " color highlighting in css files
Plug 'wellle/targets.vim'     " 
Plug 'godlygeek/tabular'      " 

call plug#end()
