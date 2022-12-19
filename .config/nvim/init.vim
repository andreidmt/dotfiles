source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugin.filetype.lua
source $HOME/.config/nvim/plugin.gruvbox-material.vim
source $HOME/.config/nvim/plugin.markdown-toc.vim
source $HOME/.config/nvim/plugin.galaxyline.lua
source $HOME/.config/nvim/plugin.treesitting.lua
source $HOME/.config/nvim/plugin.lsp-config.lua
source $HOME/.config/nvim/plugin.cmp.lua
source $HOME/.config/nvim/plugin.codi.vim
source $HOME/.config/nvim/plugin.telescope.lua
source $HOME/.config/nvim/plugin.nerdtree.vim

source $HOME/.config/nvim/plugin.gitsigns.lua
source $HOME/.config/nvim/plugin.colorizer.lua

source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/autocmd.vim

" SML
let g:sml_smlnj_executable = '/usr/bin/smlnj'

" Latex
let g:livepreview_previewer = 'zathura'

" Markdown preview
let g:mkdp_browser = 'surf'

nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>
