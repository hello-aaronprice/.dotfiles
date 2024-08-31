return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "ANGkeith/telescope-terraform-doc.nvim",
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        require('telescope').load_extension('terraform_doc')
        local terraform_docs = require('telescope').load_extension('terraform_doc')
        vim.keymap.set('n', '<leader>tfaz', ":Telescope terraform_doc full_name=hashicorp/azurerm<cr>")
        vim.keymap.set('n', '<leader>az', "<cmd>Telescope terraform_doc full_name=hashicopr/azurerm<cr>")
    end
}
