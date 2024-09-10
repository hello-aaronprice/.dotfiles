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
		"samharju/yeet.nvim",
		dependencies = {
			"stevearc/dressing.nvim", -- optional, provides sane UX
		},
		version = "*", -- update only on releases
		cmd = "Yeet",
		opts = {},
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
}
