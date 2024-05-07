" Available: 'hard', 'medium', 'soft'
" Default: medium
let g:gruvbox_material_background = 'soft'

let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

" Customize the cursor color, only works in GUI clients.
"
" Available: `'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`,
"            `'aqua'`, `'blue'`, `'purple'`
" Default: `'auto'`
let g:gruvbox_material_cursor = 'orange'

" Control the |hl-Visual| and the |hl-VisualNOS| highlight group.
"
" Available: `'grey background'`, `'green background'`, `'blue background'`,
"             `'red background'`, `'reverse'`
" Default: `'grey background'`
let g:gruvbox_material_visual = 'grey background'

set background=dark
set termguicolors

colorscheme gruvbox-material
