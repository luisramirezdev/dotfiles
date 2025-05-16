return {
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        default_direction = "right", -- siempre abre a la derecha
        preserve_equality = true,
      },
    },
    keys = {
      { "<leader>so", "<cmd>AerialToggle!<cr>", desc = "Toggle Aerial (Symbols Outline)" },
      { "[s", "<cmd>AerialPrev<cr>", desc = "Prev symbol" },
      { "]s", "<cmd>AerialNext<cr>", desc = "Next symbol" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
