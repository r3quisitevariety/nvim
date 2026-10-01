return {
	"xiyaowong/transparent.nvim",
	lazy = false, -- Loads immediately on startup
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			-- Optional: Add extra highlight groups (e.g., for floats or NvimTree)
			extra_groups = { "NormalFloat", "NvimTreeNormal" },
			-- Exclude groups if needed (rare)
			exclude_groups = {},
			on_clear = function() end,
		})
	end,
}
