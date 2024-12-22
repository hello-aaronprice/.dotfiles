return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'saghen/blink.cmp' },
      { "j-hui/fidget.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      {
        "b0o/SchemaStore.nvim",
        version = false, -- last release is way too old
      }
    },
    opts = {
      document_highlight = { enabled = true },
      servers = {
        lua_ls = {},
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
                -- fieldalignment = true,
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
        terraformls = {},
        dockerls = {},
        docker_compose_language_service = {},
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
        rust_analyzer = {},
        azure_pipelines_ls = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                "/azure-pipeline*.y*l",
                "/*.azure*",
                "Azure-Pipelines/**/*.y*l",
                "Pipelines/*.y*l",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- LSP Capabilities setup
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- LSP Attach autocmd
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
          vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
          vim.keymap.set('n', 'grr', vim.lsp.buf.references)
          vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)
          vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol)
          vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          -- LSP autoformat buffer
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
          -- LSP Document Highlights
          if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = args.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = args.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(args2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = args2.buf })
              end,
            })
          end
          -- LSP Hints
          if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            local inlay_hints = vim.api.nvim_create_augroup("lsp-inlayhint", { clear = true })
            vim.api.nvim_create_autocmd('BufEnter', {
              group = inlay_hints,
              buffer = args.buf,
              callback = function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }))
              end
            })
            vim.api.nvim_create_autocmd('InsertEnter', {
              group = inlay_hints,
              buffer = args.buf,
              callback = function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }))
              end
            })
            vim.api.nvim_create_autocmd('InsertLeave', {
              group = inlay_hints,
              buffer = args.buf,
              callback = function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }))
              end
            })
          end
        end,
      })
    end,
  },
}
