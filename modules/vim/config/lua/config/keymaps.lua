-- Undo and redo mappings
vim.keymap.set("n", "u", ":undo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-r>", ":redo<CR>", { noremap = true, silent = true })

-- Run macro in q and w registers
vim.keymap.set("n", "<leader>q", "@q", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "@w", { noremap = true, silent = true })
vim.keymap.set(
  "v",
  "<leader>q",
  ":norm! @q<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "v",
  "<leader>w",
  ":norm! @w<CR>",
  { noremap = true, silent = true }
)

-- Javascript related
vim.keymap.set("n", "<leader>ji", '0ciwimport<Esc>f=dt"ifrom <Esc>f)d<Right>', {
  noremap = true,
  silent = true,
  desc = "Turn 'require' into ESM 'import'",
})

-- Surround current word
local surrounding_chars = { "`", "_", '"', "*", "(", "[", "{" }
for _, char in ipairs(surrounding_chars) do
  -- Single wrap over cursor text
  vim.keymap.set("n", "<leader>" .. char, "bi" .. char .. "<Esc>ea" .. char, {
    noremap = true,
    silent = true,
    desc = "Wrap with " .. char,
  })
  -- Double wrap over cursor text
  vim.keymap.set(
    "n",
    "<leader>" .. char .. char,
    "bi" .. char .. char .. "<Esc>ea" .. char .. char,
    {
      noremap = true,
      silent = true,
      desc = "Double wrap with " .. char,
    }
  )
  -- Single wrap over selected text
  vim.keymap.set("v", "<leader>" .. char, "c" .. char .. char .. "<Esc>P", {
    noremap = true,
    silent = true,
    desc = "Wrap with " .. char,
  })
  -- Double wrap over selected text
  vim.keymap.set(
    "v",
    "<leader>" .. char .. char,
    "c" .. char .. char .. char .. char .. "<Esc>hP",
    {
      noremap = true,
      silent = true,
      desc = "Double wrap with " .. char,
    }
  )
end

-- Markdown mappings
vim.keymap.set(
  "n",
  "<leader>l",
  "^i* <Esc>j",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>o",
  "^i1. <Esc>j",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>T",
  ":GenTocGFM<CR>",
  { noremap = true, silent = true }
)

-- Yank/paste from/to +,* registers
vim.keymap.set("n", "<leader>p", '"+p<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", '"*p<CR>', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y<CR>', { noremap = true, silent = true })

-- Move through splits with Alt
vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true, silent = true })

-- Auto fix prev/next spelling error without changing position
vim.keymap.set(
  "n",
  "<leader>s",
  "mm[s1z=`m<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>S",
  "mm]s1z=`m<CR>",
  { noremap = true, silent = true }
)
