-- Keymaps
vim.keymap.set('n', '<leader>ff', function()
    require('telescope.builtin').find_files({ hidden = true })
end, { desc = "[F]ind [F]iles" })

vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "[F]ind with [G]rep" })

vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = "[F]ind [B]uffers" })

vim.keymap.set('n', '<leader>ft', require('telescope.builtin').treesitter, { desc = "[F]ind [T]reesitter nodes" })

vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = "[F]ind [K]eymaps" })

vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = "[F]ind [H]elp tags" })

vim.keymap.set('n', '<leader>lr', require('telescope.builtin').lsp_references, { desc = "[L]SP [R]eferences" })

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
