let NERDTreeShowHidden=1

let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

let NERDTreeGitStatusIndicatorMapCustom = {
\   "Modified"  : "*",
\   "Staged"    : "+",
\   "Untracked" : "?",
\   "Renamed"   : "->",
\   "Unmerged"  : "=",
\   "Deleted"   : "X",
\   "Dirty"     : "*",
\   "Clean"     : "✔︎",
\   "Ignored"   : '!',
\   "Unknown"   : "??"
\ }

" Keybindings
map <F1> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTreeFind | wincmd l
