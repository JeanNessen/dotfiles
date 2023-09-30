vim.g.mapleader = " " 
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<S-k>", "<C-w><up>")
vim.keymap.set("n", "<S-j>", "<C-w><down>")
vim.keymap.set("n", "<S-h>", "<C-w><left>")
vim.keymap.set("n", "<S-l>", "<C-w><right>")
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle <CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.code_action)

vim.keymap.set("n", "<A-left>", "<C-o>")
vim.keymap.set("n", "<A-right>", "<C-i>")

vim.keymap.set("v", "<leader>c", ":'<,'>norm i//<CR>")
vim.keymap.set("v", "<leader>u", ":'<,'>norm xx<CR>")

vim.keymap.set("n", "<A-o>", ":Ouroboros<CR>")
