return {
  {
    "rebelot/kanagawa.nvim",
    cmd = {},
    event = {},
    ft = {},
    keys = {},
    opts = {
      dimInactive = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
    },
    dependencies = {},
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {},
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dim_inactive_windows = true,
        highlight_groups = {
          CurSearch = { fg = "base", bg = "leaf", inherit = false },
          Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
          TelescopeBorder = { fg = "highlight_high", bg = "overlay" },
          TelescopeNormal = { fg = "subtle", bg = "overlay" },
          TelescopeSelection = { fg = "text", bg = "highlight_med" },
          TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },

          TelescopePromptNormal = { fg = "text", bg = "surface" },
          TelescopePromptBorder = { fg = "surface", bg = "surface" },
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavour = "catppuccin-mocha",
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        diffview = true,
        flash = true,
        fidget = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = true,
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    opts = {},
  },
}
