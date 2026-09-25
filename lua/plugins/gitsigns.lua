return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 500,
			virt_text_pos = "eol",
		},
		current_line_blame_formatter = " <author>, <author_time:%R> • <summary>",

		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					buffer = bufnr,
					desc = desc,
				})
			end

			map("n", "]h", gs.next_hunk, "Next changed hunk")
			map("n", "[h", gs.prev_hunk, "Previous changed hunk")

			map("n", "<leader>hp", gs.preview_hunk, "Preview changed hunk")
			map("n", "<leader>hb", gs.blame_line, "Blame current line")
			map("n", "<leader>hd", gs.diffthis, "Diff current file")
			map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
		end,
	},
}
