return {
	{
		"shortcuts/no-neck-pain.nvim",
		lazy = false,
		opts = {
			width = 125,
			minSideBufferWidth = 0,
			autocmds = {
				enableonVimEnter = true,
			},
			integration = {
				undotree = {
					position = "left",
				},
			},
		},
		keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
	},
}
