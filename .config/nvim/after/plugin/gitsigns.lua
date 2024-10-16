-- git signs config
require('gitsigns').setup {
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end, { desc = "gitsigns: Next hunk" })

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end, { desc = "gitsigns: Prev hunk" })

        map('n', '<leader>sb', gitsigns.stage_buffer, { desc = '[S]tage [B]uffer in git' })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git [B]lame' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = '[D]iff this buffer' })
    end
}
