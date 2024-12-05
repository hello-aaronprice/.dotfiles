return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "terraform", "hcl" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				terraformls = {},
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = { "tflint" } },
	},
	{
		"ANGkeith/telescope-terraform-doc.nvim",
		ft = { "terraform", "hcl" },
		config = function()
			require("telescope").load_extension("terraform_doc")
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				hcl = { "packer_fmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
			},
		},
	},
}
