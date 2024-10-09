return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
	"bash",
	"c",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"rust",
	"toml",
	"vim",
	"vimdoc"
      },
      highlight = { enable = true },
    }
  }
}
