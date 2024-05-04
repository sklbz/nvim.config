vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.termguicolors = true
vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
