return {
  "echasnovski/mini.nvim",
  config = function()
    local animate = require("mini.animate")
    animate.setup({
      cursor = {
        timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        path = animate.gen_path.line({
          predicate = function()
            return true
          end,
        }),
      },
      scroll = {
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        -- Animate equally but with 120 maximum steps instead of default 60
        subscroll = animate.gen_subscroll.equal({ max_output_steps = 120 }),
      },
      resize = {
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },
    })
  end,
}
