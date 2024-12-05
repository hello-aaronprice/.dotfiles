return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "svelte" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				svelte = {
					keys = {
						{
							"<leader>co",
							vim.lsp.action["source.organizeImports"],
							desc = "Organize Imports",
						},
					},
					capabilities = {
						workspace = {
							didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
						},
					},
				},
			},
		},
	},
}
