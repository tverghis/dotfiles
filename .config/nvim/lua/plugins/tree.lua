return {
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right"
      },
      notify = {
        threshold = vim.log.levels.WARNING,
        absolute_path = false,
      },
    }
  },
}
