return {
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
		ft = "go",
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			show_help_hints = false,
			enhanced_diff_hl = true,
		},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")
			leap.add_default_mappings()
			leap.opts.case_sensitive = true
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_always_hidden = function(name, _)
						return name == ".."
					end,
				},
				float = {
					padding = 2,
					max_width = 90,
					max_height = 0,
					border = "rounded",
				},
				win_options = {
					wrap = true,
					winblend = 0,
				},
				keymaps = {
					["<C-c>"] = false,
					["q"] = "actions.close",
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			routes = {
				{
					filter = { event = "notify", find = "No information available" },
					opts = { skip = true },
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"voldikss/vim-floaterm",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>ft",
				"<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>",
				{ desc = "Open FloatTerm" }
			)
			vim.keymap.set("n", "<leader>flt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
			vim.keymap.set("t", "<leader>flt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}