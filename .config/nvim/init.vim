syntax on
set guicursor=
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set visualbell
set ignorecase
set smartcase
set incsearch
set scrolloff=4
set signcolumn=yes
set colorcolumn=80
set splitright
" set mouse=a
" set completeopt=menuone,noinsert,noselect

let mapleader = " "

call plug#begin('~/.vim/plugged/')
Plug 'dracula/vim',{'as':'dracula'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Plug 'numtostr/FTerm.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'lewis6991/gitsigns.nvim'

" Syntax Highlighting
" Plug 'cespare/vim-toml', { 'branch': 'main' }
call plug#end()

if has('termguicolors')
  set termguicolors
endif

colorscheme dracula

" Not sure if we want to go back to this in the future...
" Go syntax highlighting
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1

" gitsigns config
lua require('gitsigns').setup()
nnoremap <leader>hl <cmd>lua require('gitsigns').toggle_current_line_blame()<cr>

" Telescope
lua require('telescope').load_extension('fzf')

nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>


" nvim-comment initialization
lua require('nvim_comment').setup({line_mapping = "<leader>'", operator_mapping = "''"})

" toggle-term
lua <<EOF
require('toggleterm').setup{
    hide_numbers = true,
    float_opts = {
        border = 'curved',
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
}
EOF
nnoremap <leader>tt <cmd>ToggleTerm size=40 direction=float border=shadow<cr>
nnoremap <leader>ty <cmd>ToggleTerm size=90 direction=vertical<cr>
tnoremap <C-t> <cmd>ToggleTerm<cr>


" Treesitter
lua <<EOF
require('nvim-treesitter.configs').setup {
    -- Can't rely on the following until Alacritty releases a universal binary (next release)
    -- until then just update plugins from iterm...
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
EOF

" nerdtree
nnoremap <leader>n <cmd>NERDTreeToggle<cr>
