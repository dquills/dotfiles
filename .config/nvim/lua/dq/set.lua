vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Don't close unsaved files when opening a new buffer
vim.opt.hidden = true

vim.opt.visualbell = true

-- ignore case when search is all lowercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true

vim.opt.scrolloff = 4

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Split right / below by default for v / h splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- global status bar
vim.opt.laststatus=3

vim.opt.updatetime = 50

vim.opt.termguicolors = true

vim.g.mapleader = " "
