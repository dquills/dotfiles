return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme dracula]])
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        end,
    },
    {
        -- read kickstart.nvim config for help on setting this up
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            vim.cmd("TSUpdate")
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local telescope_actions = require("telescope.actions")
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = { "%.git/", "node_modules/", "coverage/", "__pycache__/", "%.o", "vendor" },
                    mappings = {
                        i = {
                            ['<C-k>'] = telescope_actions.move_selection_previous,
                            ['<C-j>'] = telescope_actions.move_selection_next
                        }
                    }
                }
            }
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Spinner for status
            'j-hui/fidget.nvim',

            -- Neovim API completions
            'folke/neodev.nvim',
        },
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        },
    },
    {
        'rlane/pounce.nvim',
        keys = {
            { 's', '<cmd>Pounce<cr>', { desc = '[S]earch with pounce' } }
        },
    },
    {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup({
                line_mapping = "<leader>'",
                operator_mapping = "''",
            })
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
    'akinsho/toggleterm.nvim',
    'ryanoasis/vim-devicons',
    'jiangmiao/auto-pairs',
    'lewis6991/gitsigns.nvim',
    'nvim-lualine/lualine.nvim',
}
