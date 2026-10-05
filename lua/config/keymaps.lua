-- 1g instead of 1gt for tabs
for tab = 1, 9 do
	vim.keymap.set("n", tab .. "g", "<cmd>tabnext " .. tab .. "<cr>", {
		desc = "Go to tab " .. tab,
	})
end

-- word wrap
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>", {
	desc = "Toggle word wrap",
})
