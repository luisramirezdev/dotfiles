return {
  {
    "folke/trouble.nvim",
    enabled = true,
    cmd = { "Trouble" },
    opts = {
      focus = true,
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
  },
}
