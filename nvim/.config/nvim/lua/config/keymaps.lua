local map = vim.keymap.set
---@diagnostic disable-line:missing-parameter
-- Centered scrolling
map({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Centered Down" })
map({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Centered Up" })

-- Line navigation
map("n", "<s-h>", "^", { desc = "Start of line" })
map("n", "<s-l>", "$", { desc = "End of line" })

-- Clipboard QoL
map({ "n", "x", "o" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
map({ "n", "x", "o" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "x", "o" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- Select All
map({ "n", "i" }, "<C-a>", "ggVG", { desc = "Select All" })

-- Duplicate a line and comment out the first line
map("n", "<leader>ycp", [[yygccp]], { desc = "[y]ank [c]omment [p]aste" })

-- Execute line
map({ "n", "v" }, "<leader>xl", ":.lua<CR>", { desc = "e[x]ecute [l]ine" })
-- DANGEROUS DELETE
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "[d]elete to void register" })

-- QuickFix List navigation
map({ "n" }, "<A-j>", "<cmd>cnext<CR>", { desc = "Move Down QuickFix List" })
map({ "n" }, "<A-k>", "<cmd>cprev<CR>", { desc = "Move Up QuickFix List" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Down" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

-- LSP
map("n", "<leader>lsc", "<cmd>lua =vim.lsp.get_clients()[1].server_capabilities<CR>",
  { desc = "[l][s]p [c]apabilities" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Search words
map("n", 'sw', [[/<C-R><C-W>]], { desc = "[s]earch [w]ord" })
map("n", '<leader>swr', [[:%s@<C-R><C-W>@<C-R><C-W>@cgI<Left><Left><Left><Left>]],
  { desc = "[s]earch [w]ord and [r]eplace" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })


-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

local job_id = 0
map("n", "<C-/>", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
  job_id = vim.bo.channel
end)

map("n", "<leader>test", function()
  vim.fn.chansend(job_id, { "ls -al\r\n" })
end)
