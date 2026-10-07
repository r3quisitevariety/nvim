return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.move").setup()
		require("mini.surround").setup({
			mappings = {
				add = "<leader>sa", -- Add surrounding in Normal and Visual modes
				delete = "<leader>sd", -- Delete surrounding
				find = "<leader>sf", -- Find surrounding (to the right)
				find_left = "<leader>sF", -- Find surrounding (to the left)
				highlight = "<leader>sh", -- Highlight surrounding
				replace = "<leader>sr", -- Replace surrounding

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
		require("mini.splitjoin").setup()
		require("mini.basics").setup({
			options = {
				basic = false,
				win_borders = "auto",
			},
			mappings = {
				basic = true,
				option_toggle_prefix = [[\]],
				windows = false,
				move_with_alt = true,
			},
			autocommands = {
				basic = false,
			},
			-- Whether to disable showing non-error feedback
			silent = false,
		})
		require("mini.sessions").setup()
	end,
}
