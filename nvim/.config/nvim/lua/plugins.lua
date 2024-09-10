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
}
