return {
	{
		"nvim-treesitter/nvim-treesitter",
		ft = "dockerfile",
		opts = { ensure_installed = { "dockerfile" } },
	},
	{
		"mason.nvim",
		ft = "dockerfile",
		opts = { ensure_installed = { "hadolint" } },
	},
	{
		"neovim/nvim-lspconfig",
		ft = "dockerfile",
		opts = {
			servers = {
				dockerls = {},
				docker_compose_language_service = {},
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		ft = "dockerfile",
		optional = true,
		opts = {
			linters_by_ft = {
				dockerfile = { "hadolint" },
			},
		},
	},
}
