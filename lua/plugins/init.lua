-- Inspired from https://github.com/ChristianChiarulli/LunarVim/blob/master/lua/plugins.lua
local install_path = vim.fn.stdpath("data") ..
                         "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    vim.cmd "packadd packer.nvim"
end

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Themes and UI
    use "morhetz/gruvbox"
    use "kyazdani42/nvim-web-devicons"
    use "vim-airline/vim-airline"
    use "Yggdroot/indentLine"
    use "lukas-reineke/indent-blankline.nvim"

    -- Basic tweaks
    use "tpope/vim-surround"
    use "Asheq/close-buffers.vim"
    use "AndrewRadev/sideways.vim"
    use "unblevable/quick-scope"
    use "justinmk/vim-sneak"
    use "chaoren/vim-wordmotion"

    -- Edition plugins
    use "preservim/nerdcommenter"

    -- Git integration
    use "airblade/vim-rooter"
    use "lambdalisue/gina.vim"
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- LSP support
    use "neovim/nvim-lspconfig"
    use "glepnir/lspsaga.nvim"
    use "kabouzeid/nvim-lspinstall"

    -- Autocomplete
    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "rafamadriz/friendly-snippets"

    -- "IDE"-like features
    use "romgrk/barbar.nvim"
    use "liuchengxu/vim-which-key"
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use "sbdchd/neoformat"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/nvim-toggleterm.lua"

end)
