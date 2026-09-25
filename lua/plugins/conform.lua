return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			rust = { "rustfmt" },
			--nix = { "nixfmt" },
			nix = { "alejandra" },
			lua = { "stylua" },
			go = { "gofmt" }, -- already comes with go binary
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			kdl = { "kdlfmt" },
			typst = { "typstyle" },
		},
	},
	-- still see if this actually works, havent set up lsp yet
}
