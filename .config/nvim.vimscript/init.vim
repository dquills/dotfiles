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
set splitbelow
set laststatus=3

let mapleader = " "

" Non-plugin maps
nnoremap <Tab> <Cmd>bnext<CR>
nnoremap <S-Tab> <Cmd>bprevious<CR>

" Move a block of text up and down
xnoremap K :'<,'>move-2<CR>gv=gv
xnoremap J :'<,'>move'>+<CR>gv=gv

" Better navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Up> <Cmd>resize +2<CR>
nnoremap <C-Down> <Cmd>resize -2<CR>
nnoremap <C-Left> <Cmd>vertical resize +2<CR>
nnoremap <C-Right> <Cmd>vertical resize -2<CR>


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
Plug 'rlane/pounce.nvim'
Plug 'neovim/nvim-lspconfig'
" Syntax Highlighting
Plug 'norcalli/nvim-colorizer.lua'
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
lua require('gitsigns').setup({ numhl = true })
nnoremap <leader>hl <cmd>lua require('gitsigns').toggle_current_line_blame()<cr>

" Telescope
lua require('telescope').load_extension('fzf')

nnoremap <leader>fd <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fq <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>lr <cmd>lua require('telescope.builtin').lsp_references()<cr>

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
nnoremap <leader>ty <cmd>ToggleTerm size=5 direction=horizontal<cr>
tnoremap <C-t> <cmd>ToggleTerm<cr>
tnoremap <C-n> <C-\><C-n>


" Treesitter
lua <<EOF
require('nvim-treesitter.configs').setup {
    -- Can't rely on the following until Alacritty releases a universal binary (next release)
    -- until then just update plugins from iterm...
    ensure_installed = {"go", "rust", "javascript", "python", "lua", "vim"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
EOF

" Pounce config for fuzzy finding
nmap s <cmd>Pounce<CR>

" nerdtree
let NERDTreeShowHidden=1

nnoremap <leader>n <cmd>NERDTreeToggle<cr>

" lua files
lua require('config')

" colorizer setup
lua require'colorizer'.setup()

augroup relativenum
    autocmd!
    autocmd InsertEnter * :set nornu
    autocmd InsertLeave * :set rnu
augroup end
