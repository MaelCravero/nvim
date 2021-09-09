require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local function set_key(key, value)
    vim.api.nvim_set_keymap('n', key, value, {noremap = true, silent = true})
end

local function set_vkey(key, value)
    vim.api.nvim_set_keymap('v', key, value, {noremap = true, silent = true})
end

-- Set leader
set_key('<Space>', '<NOP>')
vim.g.mapleader = ' '
set_key('<leader>s', ':SessionSave<CR>')
set_key('<leader>S', ':SessionLoad<CR>')
set_key('<leader>q', ':BufferClose<CR>')
set_key('<leader>e', ':NvimTreeFindFile<CR>')
set_key('<leader>E', ':NvimTreeToggle<CR>')
set_key('<leader>c', ':CommentToggle<CR>')
set_vkey('<leader>c', ':CommentToggle<CR>')
set_key('<leader>t', ':Telescope<CR>')
set_key('<leader>:', ':Telescope command_history<CR>')

local mappings = {
    ["s"] = "save session",
    ["S"] = "load session",
    ["q"] = "close file",
    ["e"] = "tree on current",
    ["E"] = "toggle tree",
    ["c"] = "+comment",
    ["t"] = "telescope",
    [":"] = "find command",
    b = {
        name = "+buffers",
        c = {"<cmd>BufferClose<cr>", "close"},
        C = {"<cmd>Bdelete hidden<cr>", "clean"},
        n = {"<cmd>BufferMoveNext<cr>", "move next"},
        p = {"<cmd>BufferMovePrevious<cr>", "move prev"},
        l = {"<cmd>BufferLast<cr>", "last"},
        d = {"<cmd>BufferOrderByDirectory<cr>", "order by dir"},
        L = {"<cmd>BufferOrderByLanguage<cr>", "order by lang"},
        g = {"<cmd>BufferPick<cr>", "goto"}
    },
    d = {
        name = "+debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>", "breakpoint"},
        c = {"<cmd>DebugContinue<cr>", "continue"},
        i = {"<cmd>DebugStepInto<cr>", "step into"},
        o = {"<cmd>DebugStepOver<cr>", "step over"},
        r = {"<cmd>DebugToggleRepl<cr>", "toggle repl"},
        s = {"<cmd>DebugStart<cr>", "start"}
    },
    f = {
        name = '+find',
        f = {'<cmd>Telescope find_files<cr>', 'files'},
        g = {'<cmd>Telescope git_files<cr>', 'git files'},
        b = {'<cmd>Telescope current_buffer_fuzzy_find<cr>', 'buffer find'},
        B = {'<cmd>Telescope file_browser<cr>', 'browse'},
        G = {'<cmd>Telescope live_grep<cr>', 'grep'},
        R = {'<cmd>Telescope reloader<cr>', 'reload'},
        q = {'<cmd>Telescope quickfix<cr>', 'quickfix list'},
        l = {'<cmd>Telescope loclist<cr>', 'location list'}
    },
    h = {
        name = "+hunks",
        s = {"<cmd>Gitsigns stage_hunk<cr>", "stage"},
        u = {"<cmd>Gitsigns undo_stage_hunk<cr>", "undo stage"},
        r = {"<cmd>Gitsigns reset_hunk<cr>", "reset"},
        R = {"<cmd>Gitsigns reset_buffer<cr>", "reset buffer"},
        v = {"<cmd>Gitsigns preview_hunk<cr>", "preview"},
        b = {"<cmd>Gitsigns blame_line<cr>", "blame"},
        n = {"<cmd>Gitsigns next_hunk<cr>", "next"},
        p = {"<cmd>Gitsigns prev_hunk<cr>", "prev"}
    },
    g = {
        name = "+git",
        a = {"<cmd>Gina add %<cr>", "add"},
        b = {"<cmd>Gina blame<cr>", "add"},
        c = {"<cmd>Gina commit<cr>", "add"},
        C = {"<cmd>Gina commit --amend<cr>", "add"},
        s = {"<cmd>Gina status<cr>", "add"},
        l = {"<cmd>Gina log<cr>", "log"},
        S = {"<cmd>Telescope git_status<cr>", "list status"},
        B = {"<cmd>Telescope git_branches<cr>", "branches"},
        t = {
            name = "+telescope",
            c = {"<cmd>Telescope git_commits<cr>", "checkout"},
            C = {"<cmd>Telescope git_bcommits<cr>", "checkout current"}
        }
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics"
        },
        D = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    }
}

local wk = require("which-key")
wk.register(mappings, opts)
