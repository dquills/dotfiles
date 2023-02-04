vim.keymap.set("n", "<leader>n", "<cmd>NeoTreeShowToggle<cr>", { desc = "Show [N]eotree" })

require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        position = "left",
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_pattern = {
                "*/node_modules",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",

            },
        },
        hijack_netrw_behavior = "open_current",
    },
})

