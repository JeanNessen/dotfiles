--Disable netrw, we are using nvim File Tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("Jeanl.remap")
require("Jeanl.set")
require("Jeanl.packer")
--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])
