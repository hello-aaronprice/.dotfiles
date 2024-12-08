vim.filetype.add({
	extension = {
		svelte = "svelte",
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "svelte" } },
	},
	{
		"neovim/nvim-lspconfig",
		ft = "svelte",
		enabled = true,
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
