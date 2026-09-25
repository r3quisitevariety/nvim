return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "tabs",
			themable = false,
			show_buffer_icons = false,
			color_icons = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return " " .. count
			end,
		},
		highlights = {
			fill = { bg = "NONE" },
			tab = { bg = "NONE" },
			tab_selected = { bg = "NONE" },
			buffer = { bg = "NONE" },
			buffer_visible = { bg = "NONE" },
			buffer_selected = { bg = "NONE" },
			separator = { bg = "NONE" },
			separator_visible = { bg = "NONE" },
			separator_selected = { bg = "NONE" },
			tab_separator = { bg = "NONE" },
			tab_separator_selected = { bg = "NONE" },
		},
	},
}
