return {
  {
    "Mofiqul/dracula.nvim",
    config = function()
      vim.cmd.colorscheme("dracula")

      -- Cambios personalizados para los colores de diff
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#303030", fg = "#aaffaa" })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3a3a3a", fg = "#aaaaff" })
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3a2a2a", fg = "#ffaaaa" })
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#44475a", fg = "#ffffff" })
    end,
  },
}
