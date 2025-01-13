-- Editor Appearance and Behavior
vim.opt.syntax = "enable" -- Enable syntax highlighting
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.wrap = true -- Wrap lines visually without altering the text
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.colorcolumn = "80" -- Highlight the 80th column
vim.opt.number = true -- Show line numbers
vim.opt.cursorline = true -- Highlight the current line
-- vim.opt.cmdheight = 1                 -- Height of the command bar
vim.opt.pumheight = 15 -- Popup menu height
vim.opt.ruler = true -- Show cursor position always
vim.opt.title = true -- Set the window title

-- Indentation and Tabs
vim.opt.tabstop = 2 -- Number of spaces per tab
vim.opt.softtabstop = 2 -- Number of spaces for soft tab
vim.opt.shiftwidth = 2 -- Number of spaces for autoindent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Auto indent new lines
vim.opt.smartindent = true -- Smart indenting on new lines
vim.opt.smarttab = true -- Make tabbing smarter

-- Search and Replace
vim.opt.gdefault = true -- Use 'g' flag by default in search/replace
vim.opt.iskeyword:append("-") -- Include '-' in word definitions

-- Split and Window Behavior
vim.opt.splitbelow = true -- Open horizontal splits below current window
vim.opt.splitright = true -- Open vertical splits to the right of the current window

-- File and Encoding Settings
vim.opt.encoding = "utf-8" -- Set file encoding to UTF-8
vim.opt.fileformats = { "unix", "dos", "mac" } -- File format preference
vim.opt.fileencoding = "utf-8" -- Encoding written to file
vim.opt.backupcopy = "yes" -- Backup before overwriting a file
vim.opt.updatetime = 100 -- Time before writing to swap file

-- Spelling and Language
vim.opt.spell = false -- Disable spell checking by default
vim.opt.spelllang = "en_us" -- Set spell check language

-- Folding Settings
vim.opt.foldmethod = "syntax" -- Use syntax for folding
vim.opt.foldcolumn = "1" -- Show fold column
vim.opt.foldlevelstart = 99 -- Start with all folds open
vim.g.javascript_fold = 1 -- Enable JavaScript folding
vim.g.typescript_fold = 1 -- Enable TypeScript folding
vim.g.markdown_fold = 1 -- Enable Markdown folding

-- Miscellaneous
vim.opt.wildignore:append("*node_modules/**,*dist/**") -- Ignore directories in file search
vim.opt.virtualedit = "block" -- Allow cursor beyond end of line in visual block mode
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
vim.opt.completeopt = "menu,menuone,noselect" -- Completion menu options

-- Highlights and Colors
vim.cmd("highlight Comment cterm=italic") -- Italicize comments
vim.cmd("highlight clear SignColumn") -- Clear highlight for sign column
