return {
	"shortcuts/no-neck-pain.nvim",
	lazy = false,
	opts = {
		width = 120,
		autocmds = {
			skipEnteringNoNeckPainBuffer = true,
			enableOnVimEnter = true,
		},
		mappings = {
			enabled = true,
			toggle = "<Leader>nn",
		},
		integrations = {
			undotree = {
				position = "left",
			},
		},
	},
}
