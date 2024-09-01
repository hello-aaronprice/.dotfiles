require("hello-aaronprice.set")
require("hello-aaronprice.remap")
require("hello-aaronprice.lazy_init")

local function autocmd(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

function R(name)
	require("plenary.reload").reload_module(name)
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = autocmd("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = autocmd("BufWritePre"),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = autocmd("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = autocmd("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"grug-far",
		"help",
		"lspinfo",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"dbout",
		"gitsigns.blame",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
			desc = "Quit buffer",
		})
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
