return {
  { "echasnovski/mini.statusline", version = "*", opts = {} },
  {
    'echasnovski/mini.icons',
    version = '*',
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    config = function(_, opts)
      require('grug-far').setup({})
      vim.keymap.set("n", "<leader>gfw",
        "<cmd>lua require('grug-far').with_visual_selection({prefills = {search = vim.fn.expand(\"<cword>\")}})<CR>",
        { desc = "[g]rug [f]ar [w]ord" })
      vim.keymap.set("n", "<leader>gf", "<cmd>GrugFar<CR>",
        { desc = "[g]rug [f]ar" })
    end
  },
}
