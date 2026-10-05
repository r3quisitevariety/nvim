vim.lsp.enable("luals")
vim.lsp.enable("rust")
vim.lsp.enable("tsserver")
vim.lsp.enable("nix")
vim.lsp.enable("gopls")
vim.lsp.enable("typst")
--vim.lsp.enable("harper")

-- lsp config --

vim.lsp.config("luals", {
	-- lua example is purposefully comment heavy for the sake of reference
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" }, --calls the binary from path
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- root markers are important so the lsp is everywhere
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
})

vim.lsp.config("rust", {
	cmd = { "rust-analyzer" }, -- from rustup
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
})

vim.lsp.config("tsserver", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
})

vim.lsp.config("typst", {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { ".git" },
})

vim.lsp.config("nix", {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { { "flake.nix", "flake.lock", "default.nix" }, ".git" },
	settings = {
		["nixd"] = {
			nix = {
				flake = {
					enable = true,
					autoArchive = true,
				},
			},
		},
	},
})

vim.lsp.config["harper"] = {
	cmd = { "harper-ls", "--stdio" },
	filetypes = { "markdown", "text", "tex", "typst" },
}

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
})
