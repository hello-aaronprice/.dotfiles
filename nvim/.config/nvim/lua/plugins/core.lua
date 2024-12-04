return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "[S]earch [F]iles",
      },
    },
  },
}
