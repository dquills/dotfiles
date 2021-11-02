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
" set completeopt=menuone,noinsert,noselect

let mapleader = " "

call plug#begin('~/.vim/plugged/')
Plug 'dracula/vim',{'as':'dracula'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'numtostr/FTerm.nvim'

" Syntax Highlighting
Plug 'cespare/vim-toml', { 'branch': 'main' }
call plug#end()

if has('termguicolors')
  set termguicolors
endif

colorscheme dracula


" Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" Fterm
nnoremap <leader>ft <cmd>lua require('FTerm').toggle()<cr>
tnoremap <C-t> <Cmd>lua require('FTerm').toggle()<cr>
