return {
    "machakann/vim-highlightedyank",
    "airblade/vim-rooter",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    { "nvim-treesitter/nvim-treesitter",  run = ":TSUpdate" },
    { "rose-pine/neovim",                 name = "rose-pine" },

    -- LSP
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },

    -- Finder/picker
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
