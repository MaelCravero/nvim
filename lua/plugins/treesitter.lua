require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {enable = true}
}

vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
