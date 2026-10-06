return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua",
			"tsx",
			"markdown",
			"markdown_inline",
			"nix",
			"rust",
			"javascript",
			"typescript",
			"go",
			"typst",
		},
		highlight = { enable = true },
	},
}
