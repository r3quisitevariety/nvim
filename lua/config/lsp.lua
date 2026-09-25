vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf, silent = true }

		vim.keymap.set(
			"n",
			"K",
			vim.lsp.buf.hover,
			vim.tbl_extend("force", opts, {
				desc = "LSP hover documentation",
			})
		)
		vim.keymap.set(
			"n",
			"gd",
			vim.lsp.buf.definition,
			vim.tbl_extend("force", opts, {
				desc = "LSP go to definition",
			})
		)
		vim.keymap.set(
			"n",
			"gr",
			vim.lsp.buf.references,
			vim.tbl_extend("force", opts, {
				desc = "LSP references",
			})
		)
		vim.keymap.set(
			"n",
			"<leader>rn",
			vim.lsp.buf.rename,
			vim.tbl_extend("force", opts, {
				desc = "LSP rename",
			})
		)
		vim.keymap.set(
			"n",
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, {
				desc = "LSP code action",
			})
		)
		vim.keymap.set(
			"n",
			"[d",
			function()
				vim.diagnostic.jump({ count = -1, float = true })
			end,
			vim.tbl_extend("force", opts, {
				desc = "Previous diagnostic",
			})
		)
		vim.keymap.set(
			"n",
			"]d",
			function()
				vim.diagnostic.jump({ count = 1, float = true })
			end,
			vim.tbl_extend("force", opts, {
				desc = "Next diagnostic",
			})
		)
	end,
})

vim.lsp.config("luals", {
	cmd = { "lua-language-server" }, --calls the binary from path
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
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
	cmd = { "nil" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", "flake.lock", ".git", "default.nix" },
	settings = {
		["nil"] = {
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

-- ENABLE / DISABLE LANGUAGES --
--------------------------------------------
vim.lsp.enable("luals")
vim.lsp.enable("rust")
vim.lsp.enable("tsserver")
vim.lsp.enable("nix")
--vim.lsp.enable("harper")
vim.lsp.enable("gopls")
vim.lsp.enable("typst")
