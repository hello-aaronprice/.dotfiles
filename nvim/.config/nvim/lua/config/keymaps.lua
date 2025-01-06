-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Centered Down" })
map({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Centered Up" })

-- Line navigation
map("n", "<s-h>", "^", { desc = "Start of line" })
map("n", "<s-l>", "$", { desc = "End of line" })

-- Clipboard QoL
map({ "n", "x", "o" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
map({ "n", "x", "o" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "x", "o" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Down" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

-- Select All
map({ "n", "i" }, "<C-a>", "ggVG", { desc = "Select All" })

-- Search words
map(
  "n",
  "<leader>swr",
  [[:%s@<C-R><C-W>@<C-R><C-W>@cgI<Left><Left><Left><Left>]],
  { desc = "[s]earch [w]ord and [r]eplace" }
)
