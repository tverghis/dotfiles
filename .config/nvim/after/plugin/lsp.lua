local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {"gopls", "rust_analyzer", "lua_ls"},
    handlers = {
        lsp_zero.default_setup,
    },
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
