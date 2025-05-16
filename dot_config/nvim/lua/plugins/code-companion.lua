return {
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
      },
      {
        "<leader>ai",
        "<cmd>CodeCompanion<cr>",
        desc = "Inline Assistant",
        mode = { "n", "v" },
        noremap = true,
        silent = true,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
