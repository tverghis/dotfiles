require("rose-pine").setup({
    variant = "auto",
    dark = "auto",
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
    },

    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
})

vim.cmd("colorscheme rose-pine")
