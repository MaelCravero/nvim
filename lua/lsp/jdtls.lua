local jdtls = vim.fn.stdpath("data") ..
                              "/lspinstall/java/jdtls.sh"
require"lspconfig".jdtls.setup{cmd = {jdtls}}
