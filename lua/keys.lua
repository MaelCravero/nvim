local function nmap(...) vim.api.nvim_set_keymap("n", ...) end

-- Tab buffer navigation
nmap("<Tab>", ":bnext<CR>", {noremap = true, silent = true})
nmap("<S-Tab>", ":bprev<CR>", {noremap = true, silent = true})
