local lspconfig = require 'lspconfig'

-- Diagnostics config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  underline = { severity_limit = "Error" },
  signs = true,
  update_in_insert = false,
})


-- Borders
-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
--     width = 80,
--     border = 'double',
-- })


local function lsp_map(mode, left_side, right_side)
    vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), mode, left_side, right_side, { noremap = true })
end

local function on_attach(client)
    -- Bindings
    -- go to def / refs / type def
    lsp_map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
    lsp_map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
    lsp_map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    lsp_map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

    lsp_map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')

    lsp_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end


local default_config = {
    on_attach = on_attach,
}

local gopls_config = {
    on_attach = on_attach,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}

local rust_config = {
    cmd = { "/Users/damian.quilling/.config/rust-analyzer", "-v" },
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup(rust_config)

lspconfig.gopls.setup(gopls_config)
lspconfig.pyright.setup(default_config)
