-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local opts = { noremap = true, silent = true }

-- Mapear Cmd+S para guardar archivos en modo normal
vim.keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save File", noremap = true, silent = true })

-- Mapear Cmd+S para guardar archivos en modo inserción y salir al modo normal
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>", { desc = "Save File and Exit Insert Mode", noremap = true, silent = true })

-- Mapear Ctrl+S para guardar archivos en modo normal
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save File", noremap = true, silent = true })

-- Mapear Ctrl+S para guardar archivos en modo inserción y salir al modo normal
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save File and Exit Insert Mode", noremap = true, silent = true })

-- Mapear jj para salir del modo inserción a modo normal
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode", noremap = true, silent = true })

-- Mapear kj para guardar el archivo y salir del modo inserción a modo normal
vim.keymap.set("i", "kj", "<Esc>:w<CR>", { desc = "Save File and Exit Insert Mode", noremap = true, silent = true })

-- Mapear Search box
vim.keymap.set("n", "<leader>sf", ":SearchBoxMatchAll<CR>", { noremap = true, silent = true })

-- Find and replace
vim.keymap.set("n", "<leader>r ", ":SearchBoxReplace<CR>", { noremap = true, silent = true })

-- Normal-mode commands
vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-Up>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<A-Left>", ":MoveHChar(-1)<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":MoveHChar(1)<CR>", opts)
vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-Up>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-Left>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-Right>", ":MoveHBlock(1)<CR>", opts)

-- Copilot
vim.keymap.set("i", "<Tab>", function()
  require("copilot.suggestion").accept()
end, { desc = "Copilot Accept" })
