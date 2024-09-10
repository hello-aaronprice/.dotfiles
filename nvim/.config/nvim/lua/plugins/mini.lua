return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.icons").setup()
		require("mini.diff").setup()
		require("mini.git").setup()

		local animate = require("mini.animate")
		animate.setup({
			cursor = {
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				path = animate.gen_path.line({
					predicate = function()
						return true
					end,
				}),
			},
			scroll = {
				-- Animate equally but with 120 maximum steps instead of default 60
				subscroll = animate.gen_subscroll.equal({ max_output_steps = 120 }),
			},
		})

		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = true })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
