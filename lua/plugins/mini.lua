return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup()
		require("mini.move").setup()
		--require("mini.surround").setup()
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
	end,
}
