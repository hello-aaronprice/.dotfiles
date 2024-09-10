return {
	{
		"shortcuts/no-neck-pain.nvim",
		lazy = false,
		opts = {
			width = 135,
			minSideBufferWidth = 10,
			autocmds = {
				skipEnteringNoNeckPainBuffer = true,
				enableOnVimEnter = false,
			},
			integrations = {
				undotree = {
					position = "left",
				},
			},
		},
		keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
	},
}
