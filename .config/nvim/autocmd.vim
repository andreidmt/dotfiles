" Auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd! BufWritePost $MYVIMRC source %

" Filetype association 
autocmd BufRead,BufNewFile *.js.flow set filetype=javascript
autocmd BufRead,BufNewFile *.flow set filetype=javascript
autocmd BufRead,BufNewFile *.ejs set filetype=html

autocmd BufRead,BufNewFile .c8rc set filetype=json
autocmd BufRead,BufNewFile .remarkc set filetype=json
autocmd BufRead,BufNewFile .browserslistrc set filetype=json
autocmd BufRead,BufNewFile .commitlintrc set filetype=json
autocmd BufRead,BufNewFile .eslintrc set filetype=json
autocmd BufRead,BufNewFile .lintstagedrc set filetype=json
autocmd BufRead,BufNewFile .markdownlintrc set filetype=json
autocmd BufRead,BufNewFile .prettierrc set filetype=json
autocmd BufRead,BufNewFile .swcrc set filetype=json
autocmd BufRead,BufNewFile .releaserc set filetype=json

autocmd BufRead,BufNewFile .zshrc set filetype=zsh
autocmd BufRead,BufNewFile .xinitrc set filetype=bash
