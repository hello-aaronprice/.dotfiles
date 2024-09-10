return {
	{
		"shortcuts/no-neck-pain.nvim",
		lazy = false,
		opts = {
			width = 150,
			minSideBufferWidth = 0,
			autocmds = {
				skipEnteringNoNeckPainBuffer = true,
				enableOnVimEnter = false,
			},
			integrations = {
				undotree = {
					position = "right",
				},
			},
		},
		keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
	},
}
