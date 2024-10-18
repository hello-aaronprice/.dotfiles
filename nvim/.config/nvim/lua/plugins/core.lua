-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { -- add gruvbox
    "ellisonleao/gruvbox.nvim",
    cmd = {}, -- list of commands will be extended with your custom commands
    event = {}, -- list of events will be extended with your custom events
    ft = {}, -- list of filetypes will be extended with your custom filetypes
    keys = {}, -- list of keymaps will be extended with your custom keymaps
    opts = {}, -- Your custom options will be merged with the default opts
    dependencies = {}, -- list of dependencies will be extended with your custom dependencies
  },

  -- Configure LazyVim to load rose-pine
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}
