return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "svelte" } },
	},
	{
		"neovim/nvim-lspconfig",
		ft = "svelte",
		opts = {
			servers = {
				svelte = {},
				capabilities = {
					workspace = {
						didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
					},
				},
			},
		},
	},
}
