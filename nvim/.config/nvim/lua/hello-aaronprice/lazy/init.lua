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
}
