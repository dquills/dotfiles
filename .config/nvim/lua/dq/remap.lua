-- Remaps and things

-- Normal mode
-- Set tab / shift+tab to go back and forth in buffers in normal mode
vim.keymap.set("n", "<Tab>", "<cmd>:bnext<CR>", { desc = 'Next Buffer' })
vim.keymap.set("n", "<S-Tab>", "<cmd>:bprev<CR>", { desc = 'Prev Buffer' })

vim.keymap.set("n", "Q", "<nop>")

-- better navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-Up>", "<cmd>:resize +2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>:resize -2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>:vertical resize +2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>:vertical resize -2<cr>")


-- Visual mode
-- Move blocks up and down with shift+J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected text down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected text up' })

