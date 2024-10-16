return {
  {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" } },
    opts = {
      width = 120,
      autocmds = {
        skipEnteringNoNeckPainBuffer = true,
        enableOnVimEnter = false,
      },
      integrations = {
        undotree = {
          position = "left",
        },
      },
    },
  },
}
