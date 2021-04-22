-- Use settings from .vimrc
vim.cmd "source ~/.vimrc"

-- Global settings

vim.cmd "colorscheme gruvbox"
vim.cmd "set termguicolors"
vim.cmd "set background=dark"
vim.cmd "set cursorline"
vim.cmd "set noshowcmd"
vim.cmd "set noshowmode"

vim.g.mapleader = " "
vim.g.maplocalleader = "<CR>"

-- Load configs
require("plugins")
require("keys")

-- Plugin configs
require("plugins.barbar")

vim.cmd "source ~/.config/nvim/vimscript/airline.vim"
vim.cmd "source ~/.config/nvim/vimscript/gina.vim"
vim.cmd "source ~/.config/nvim/vimscript/indentline.vim"
vim.cmd "source ~/.config/nvim/vimscript/neoformat.vim"
vim.cmd "source ~/.config/nvim/vimscript/quickscope.vim"
vim.cmd "source ~/.config/nvim/vimscript/sneak.vim"
vim.cmd "source ~/.config/nvim/vimscript/whichkey.vim"
