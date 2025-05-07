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

-- Mostrar archivos usados recientemente
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    -- No restaurar si ya hay archivos abiertos reales
    local real_files_open = false
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
        real_files_open = true
        break
      end
    end

    if not real_files_open then
      require("persistence").load()
    end
  end,
})
