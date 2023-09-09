vim.g.mapleader = " " 
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-k>", "<C-w><up>")
vim.keymap.set("n", "<A-j>", "<C-w><down>")
vim.keymap.set("n", "<A-h>", "<C-w><left>")
vim.keymap.set("n", "<A-l>", "<C-w><right>")
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")

vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle <CR>")
