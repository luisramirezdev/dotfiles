return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        prismals = {
          autostart = true,
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
