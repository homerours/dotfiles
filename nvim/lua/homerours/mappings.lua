vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<c-o>:stopinsert<CR>")

vim.keymap.set("n", "<leader>e", vim.cmd.Vex)
-- close all other windows
vim.keymap.set("n", "<leader>o", ":only<CR>")
-- remove search highlighting
vim.keymap.set("n", "<leader>*", ":noh<CR>")

-- move visual selection
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")
-- open last buffer
vim.keymap.set("n", "<leader>l", ":b#<CR>")

-- J without moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- paste without loosing register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move between tabs
vim.keymap.set("n", "<S-h>", "gT")
vim.keymap.set("n", "<S-l>", "gt")

--vim.keymap.set("i", "<TAB>", "<C-n>")
--vim.keymap.set("i", "<S-TAB>", "<C-p>")
