return {
	"Kicamon/markdown-table-mode.nvim",
	-- run :Mtm to enable
	config = function()
		require("markdown-table-mode").setup({
			filetype = {
				"*.md",
			},
			options = {
				insert = true, -- when typing "|"
				insert_leave = true, -- when leaving insert
				pad_separator_line = false, -- add space in separator line
				alig_style = "default", -- default, left, center, right
			},
		})
	end,
}
