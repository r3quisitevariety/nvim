return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		--{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },
	},
	config = function()
		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		})
	end,
}
