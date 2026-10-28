return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	keys = {
		{ "<Leader>od", "<Cmd>Obsidian dailies<CR>", desc = "obsidian daily notes" },
		{
			"<leader>dt",
			function()
				local date_str = os.date("###### %A, %B %-d, %Y, %I:%M %p")
				vim.api.nvim_put({ date_str }, "l", true, true)
			end,
			desc = "Insert date-time stamp",
		},
	},

	opts = {
		legacy_commands = false,
		frontmatter = {
			enabled = false,
		},
		workspaces = {
			{
				name = "obsidian",
				path = "~/Documents/masterplan",
			},
		},

		ui = {
			enable = false,
		},

		daily_notes = {
			enabled = true,
			folder = "_system/periodic/daily",
			--date_format = "%B %-d, %Y",
			--default_tags = "type/dailynotes",
		},
	},
}
