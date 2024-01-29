" Codi is an interactive scratchpad for hackers. It opens a pane synchronized to 
" your main buffer which displays the results of evaluating each line as you 
" type (with NeoVim or Vim with +job and +channel, asynchronously). 
" It's extensible to nearly any language that provides a REPL!

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
