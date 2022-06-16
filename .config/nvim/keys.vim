let mapleader="\<SPACE>"

nnoremap u     :undo<CR> " undo
nnoremap <C-r> :redo<CR> " redo

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
