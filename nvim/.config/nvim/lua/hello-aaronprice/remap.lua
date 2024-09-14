-- TODO: check against lsp mappings

-- Navigation and manipulation essentials
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", ">", ">gv", { desc = "Smart Indent" })
vim.keymap.set("v", "<", "<gv", { desc = "Smart Indent" })
vim.keymap.set("v", "y", "ygv<esc>", { desc = "Cursor to original position" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Cursor to original position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centered on scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered on scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centered on next jump" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centered on Next jump" })
vim.keymap.set("n", "<Tab>", "<C-W>w", { desc = "Switch buffer" })
vim.keymap.set("n", "<S-Tab>", "<C-W>W", { desc = "Switch buffer" })
vim.keymap.set("n", "<C-W>v", "<C-W>v<CR><C-W>l", { desc = "Switch buffer" })

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmuxhsessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Execute current line
vim.keymap.set("n", "<leader>bb", function()
	vim.cmd(":! " .. vim.fn.getline("."))
end)

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word uner cursor" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "<leader>pv", "<cmd>Oil --float<cr>", { desc = "Open Oil" })
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "Open Oil" })

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
