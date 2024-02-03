function ColourMyPencils(colour)
	colour = colour or "rose-pine"
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
end

ColourMyPencils()
