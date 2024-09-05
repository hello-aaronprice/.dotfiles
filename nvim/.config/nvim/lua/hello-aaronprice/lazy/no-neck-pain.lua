return {
	"shortcuts/no-neck-pain.nvim",
	keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
	config = function()
		require("no-neck-pain").setup({
			width = 150,
			autocmds = {
				skipEnteringNoNeckPainBuffer = true,
			},
			bufferOptionsColors = {
				background = "rose-pine-dawn",
			},
		})
	end,
}
