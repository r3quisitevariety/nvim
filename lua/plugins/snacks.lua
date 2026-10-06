return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		git = { enabled = true },
		gitbrowse = { enabled = true },
		bigfile = { enabled = true },
		image = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		-- makes picker transparent
		picker = {
			enabled = true,
			on_show = function()
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					for group in vim.wo[win].winhighlight:gmatch(":(Snacks[%w_]+)") do
						local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
						highlight.bg = "NONE"
						highlight.ctermbg = "NONE"
						vim.api.nvim_set_hl(0, group, highlight)
					end
				end
			end,
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},

	keys = {
		{
			"<C-e>",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>gg",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		-- LSP
		{
			"<leader>gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"<leader>gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
	},
}
