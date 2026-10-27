return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
		},
		config = function()
			require("nvim-tree").setup({
				-- Add custom options here, e.g., filters or view settings
				view = {
					width = 35,
					side = "left",
					number = true,
					relativenumber = true,
				},
				tab = {
					sync = {
						open = true, -- if tree is open in one tab, open in others
						close = true, -- if tree is closed in one tab, close in others
					},
				},
				update_focused_file = {
					enable = true,
					update_root = { enable = true }, -- also re-root to the file's dir
				},
			})
		end,
	},
}
