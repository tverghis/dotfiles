-- Fat cursor
vim.opt.guicursor = ""

-- Lines & scroll
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.scrolloff = 2
vim.opt.wrap = false

-- Tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable 24-bit RGB colors and set colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("rose-pine")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})
