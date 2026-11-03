return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		local theme = require("lualine.themes.auto")
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		local foreground = normal.fg and string.format("#%06x", normal.fg) or "NONE"

		for _, mode in pairs(theme) do
			for _, section in pairs(mode) do
				section.bg = "NONE"
				section.fg = foreground
			end
		end

		opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
			theme = theme,
			section_separators = "",
			component_separators = { left = "", right = "" },
		})
		return opts
	end,
}
