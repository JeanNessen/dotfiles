vim.opt.conceallevel = 2

vim.keymap.set("n", "<leader>toc", ":Neorg toc<CR> :vertical resize 50<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>no", ":Neorg ", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nw", ":Neorg workspace ", { noremap = true, silent = true })