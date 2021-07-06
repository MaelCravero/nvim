require"lspconfig".pyright.setup {
    cmd = {
        vim.fn.stdpath("data") ..
            "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"
    },
    capabilities = capabilities,
    settings = {python = {venvPath = "/home/mael/.virtualenvs"}}
}
-- require"lspconfig".pyls.setup {capabilities = capabilities}
