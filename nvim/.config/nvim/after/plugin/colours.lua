function ColourMyPencils(colour)
	colour = colour or "kanagawa"
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
end

ColourMyPencils()
