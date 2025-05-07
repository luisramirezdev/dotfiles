-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("conform").format({ async = false, lsp_fallback = true })
  end,
})

-- Ocultar sugerencias de Copilot cuando el menú de `blink.cmp` se abre
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

-- Mostrar nuevamente las sugerencias de Copilot cuando el menú de `blink.cmp` se cierra
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
