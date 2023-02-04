vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("dq.set")
require("dq.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Augroup & autocmd aliases
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Relative nums in normal mode & line numbers in insert mode
local relativenum_group = augroup('relativenum', {})
autocmd({'InsertEnter'}, {
    group = relativenum_group,
    pattern = "*",
    command = ":set nornu"
})

autocmd({'InsertLeave'}, {
    group = relativenum_group,
    pattern = "*",
    command = ":set rnu"
})
