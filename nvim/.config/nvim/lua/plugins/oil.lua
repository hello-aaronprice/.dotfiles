return {
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
      { "<leader>pv", "<cmd>Oil --float<cr>", { desc = "Open Oil" } },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".."
          end,
        },
        float = {
          padding = 2,
          max_width = 100,
          max_height = 0,
          border = "rounded",
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["q"] = "action.close",
        },
      })
    end,
  },
}
