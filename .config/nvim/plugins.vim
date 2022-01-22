call plug#begin(stdpath('data') . '/plugged')
"
" Easily speed up neovim startup time!
Plug 'nathom/filetype.nvim' 

" Core
Plug 'nvim-lua/plenary.nvim'         " Lua helper functions
Plug 'editorconfig/editorconfig-vim' " Read .editorconfig
Plug 'tpope/vim-commentary'   	     " Toggle comments
Plug 'matze/vim-move'                " Move multiple selected lines
Plug 'rstacruz/vim-closer'           " Auto close {,[,(

" Color scheme
Plug 'sainnhe/gruvbox-material'

" File browser
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'          " git commands
Plug 'lewis6991/gitsigns.nvim'     " git changes in gutter
Plug 'Xuyuanp/nerdtree-git-plugin' " git changes in file browser

" File finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Status bar
Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Languase Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Cool
Plug 'gyim/vim-boxdraw'            " Draw ASCII boxes
Plug 'metakirby5/codi.vim'         " Sketchpad
Plug 'mzlogin/vim-markdown-toc'    " Auto Table of Contents based on Markdown Headings

" SML
Plug 'jez/vim-better-sml'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Other
Plug 'stevearc/vim-arduino' " Compile, upload, and debugg arduino sketches

" Expendable
Plug 'tpope/vim-sensible'     " 
Plug 'tpope/vim-unimpaired'   " 
Plug 'tpope/vim-characterize' " 
Plug 'ap/vim-css-color'       " color highlighting in css files
Plug 'wellle/targets.vim'     " 
Plug 'godlygeek/tabular'      " 

call plug#end()
