return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      { 'echasnovski/mini.icons', version = '*' }, },
    opts = {
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
