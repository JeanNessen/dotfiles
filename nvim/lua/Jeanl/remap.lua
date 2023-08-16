vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle <CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<A-k>", "<C-w><up>")
vim.keymap.set("n", "<A-j>", "<C-w><down>")
vim.keymap.set("n", "<A-h>", "<C-w><left>")
vim.keymap.set("n", "<A-l>", "<C-w><right>")
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")

vim.keymap.set("n", "<A-left>", "<C-o>")
vim.keymap.set("n", "<A-right>", "<C-i>")

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.code_action)

vim.keymap.set("v", "<leader>c", ":'<,'>norm i//<CR>")
vim.keymap.set("v", "<leader>u", ":'<,'>norm xx<CR>")

vim.keymap.set("n", "<C-i>", "V :'<,'>TSCppDefineClassFunc <CR>")
vim.keymap.set("v", "<C-i>", ":'<,'>TSCppDefineClassFunc <CR>")

vim.keymap.set("n", "<A-o>", ":Ouroboros<CR>")

vim.keymap.set("n", "<leader>tab", ":tabnew<CR>")

vim.keymap.set("t", "<esc>", "<C-\\><C-N>")
vim.keymap.set("n", "<leader>db", ":lua require('dapui').toggle() <CR>")
