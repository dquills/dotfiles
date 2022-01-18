local lspconfig = require 'lspconfig'

-- Diagnostics config

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  underline = { severity_limit = "Error" },
  signs = true,
  update_in_insert = false,
})


-- Borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  width = 80,
  border = 'single',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
  border = 'single',
})

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), mode, left_side, right_side, { noremap = true })
end

local function on_attach(client)
    -- Bindings
    -- go to def / refs / type def
    lsp_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    lsp_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    lsp_map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

    lsp_map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')

    lsp_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end


local default_config = {
  on_attach = on_attach,
}

lspconfig.gopls.setup(default_config)
