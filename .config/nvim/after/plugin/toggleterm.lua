-- Setup
require('toggleterm').setup{
    hide_numbers = true,
    float_opts = {
        border = 'curved',
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
}

-- keymaps
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm size=40 direction=float border=shadow<cr>", { desc = 'Spawn floating [T]oggle[T]erm' })

vim.keymap.set("n", "<leader>ty", "<cmd>ToggleTerm size=5 direction=horizontal<cr>", { desc =  'Spawn ToggleTerm at the bottom' })

vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm<cr>")
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")
