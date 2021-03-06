require('gitsigns').setup {
    signs = {
        add = {
            hl = 'GitSignsAdd',
            text = '│',
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn'
        },
        change = {
            hl = 'GitSignsChange',
            text = '│',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn'
        },
        delete = {
            hl = 'GitSignsDelete',
            text = '_',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn'
        },
        topdelete = {
            hl = 'GitSignsDelete',
            text = '‾',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn'
        },
        changedelete = {
            hl = 'GitSignsChange',
            text = '~',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn'
        }
    },
    numhl = false,
    linehl = false,
    keymaps = {
        -- Text objects
        ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
    },
    watch_index = {interval = 1000},
    current_line_blame = true,
    sign_priority = 50,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    use_decoration_api = true,
    use_internal_diff = true -- If luajit is present
}
