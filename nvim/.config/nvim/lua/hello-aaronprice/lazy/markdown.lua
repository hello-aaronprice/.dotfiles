return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvtreesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown", "vimwiki" },
		})
	end,
	vim.treesitter.language.register("markdown", "vimwiki"),
}
