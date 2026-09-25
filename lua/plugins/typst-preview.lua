return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = {
		-- forces typst-preview to look in PATH instead of downloading the binaries itself
		dependencies_bin = {
			tinymist = "tinymist",
			websocat = "websocat",
		},
	}, -- lazy.nvim will implicitly calls `setup {}`
}
