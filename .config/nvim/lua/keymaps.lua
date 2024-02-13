vim.g.mapleader = " "

-- Save
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Escape
vim.keymap.set({"i", "v"}, "jk", "<Esc>")

-- Insert new rows above/below current line
vim.keymap.set("n", "oo", "o<Esc>")
vim.keymap.set("n", "OO", "O<Esc>")

-- Move selection up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Use home-row keys to navigate to start/end of lines
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

-- Open netrw
vim.keymap.set("", "<C-x>", vim.cmd.Ex)

-- Center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
