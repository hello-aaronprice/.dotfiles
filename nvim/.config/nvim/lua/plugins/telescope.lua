return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescopeConfig = require('telescope.config')
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/**")
    require('telescope').setup({
      defaults = {
        -- vimgrep_arguments = vimgrep_arguments,
        path_display = { 'truncate' },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "-L", "--hidden", "--glob", "!**/.git/**" },
          theme = "ivy"
        },
      },
      extensions = {
        fzf = {},
      },
    })
    require('telescope').load_extension('fzf')
    vim.keymap.set("n", "<leader>sd", require('telescope.builtin').diagnostics, { desc = "[s]earch [d]iagnostics" })
    vim.keymap.set("n", "<leader>ss", require('telescope.builtin').builtin, { desc = "[s]earch [s]elect Telescope" })
    vim.keymap.set("n", "<leader>sk", require('telescope.builtin').keymaps, { desc = "[s]earch [f]eymaps" })
    vim.keymap.set("n", "<leader>sb", require('telescope.builtin').buffers, { desc = "[s]earch [b]uffers" })
    vim.keymap.set("n", "<leader>sh", require('telescope.builtin').help_tags, { desc = "[s]earch [h]iles" })
    vim.keymap.set("n", "<leader>sf", require('telescope.builtin').find_files, { desc = "[s]earch [f]iles" })
    vim.keymap.set("n", "<leader>sc", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config") }
    end, { desc = "[s]earch [c]onfig" })
    vim.keymap.set("n", "<leader>sp", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }
    end, { desc = "[s]earch [p]ackages" })
    vim.keymap.set("n", "<leader>sg", function()
      require "config.telescope.multigrep".setup()
    end, { desc = "[s]earch [g]rep" })
  end
}
