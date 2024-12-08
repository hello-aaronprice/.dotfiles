return {
	-- formatting
	{
		"stevearc/conform.nvim",
		ft = "go",
		opts = {
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
			},
		},
	},
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		ft = "go",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"go",
				"gomod",
				"gowork",
				"gosum",
				"goimports",
				"gofumpt",
				"gomodifytags",
				"impl",
			})
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		ft = "go",
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
			},
			setup = {
				gopls = function()
					-- workaround for gopls not supporting semanticTokensProvider
					-- https://github.com/golang/go/issues/54531#issuecomment-1464982242
					vim.api.nvim_create_autocmd("LspAttach", {
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client.name == "gopls" then
								if not client.server_capabilities.semanticTokensProvider then
									local semantic = client.config.capabilities.textDocument.semanticTokens
									client.server_capabilities.semanticTokensProvider = {
										full = true,
										legend = {
											tokenTypes = semantic.tokenTypes,
											tokenModifiers = semantic.tokenModifiers,
										},
										range = true,
									}
								end
							end
						end,
					})
				end,
			},
		},
	},
}
