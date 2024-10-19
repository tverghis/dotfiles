vim.g.mapleader = " "

-- Save
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Escape
vim.keymap.set({ "i", "v" }, "jk", "<Esc>")

-- Insert new rows above/below current line
vim.keymap.set("n", "oo", "o<Esc>")
vim.keymap.set("n", "OO", "O<Esc>")

-- Use home-row keys to navigate to start/end of lines
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

-- Center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

-- Swap buffers
vim.keymap.set("n", "<leader><leader>", "<C-^>")

vim.keymap.set("n", "<C-f>", require("fzf-lua").files, {})
vim.keymap.set("n", "<C-b>", require("fzf-lua").buffers, {})
