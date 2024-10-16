return {
	"shortcuts/no-neck-pain.nvim",
	lazy = false,
	keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "Turn NoNeckPain On/Off" } },
	opts = {
		width = 120,
		autocmds = {
			skipEnteringNoNeckPainBuffer = true,
			enableOnVimEnter = true,
		},
		integrations = {
			undotree = {
				position = "left",
			},
		},
	},
}
