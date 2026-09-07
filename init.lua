vim.g.mapleader = " "

-- imports
require("config.lazy")
require("config.lsp")
require("oil").setup()
require("ibl").setup()

-- options
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.linebreak = true
vim.opt.autoread = true
vim.opt.termguicolors = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- keymaps
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>", {
	desc = "Toggle word wrap",
})

-- 1g instead of 1gt for tabs
for tab = 1, 9 do
	vim.keymap.set("n", tab .. "g", "<cmd>tabnext " .. tab .. "<cr>", {
		desc = "Go to tab " .. tab,
	})
end

-- autodetects change in current file
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
	group = vim.api.nvim_create_augroup("AutoReload", { clear = true }),
	callback = function()
		vim.cmd.checktime()
	end,
})

-- appearance
vim.opt.fillchars:append({ eob = " " })

local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"SignColumn",
	"StatusLine",
	"StatusLineNC",
	"EndOfBuffer",
	"NeoTreeNormal",
	"NeoTreeNormalNC",
	"LineNr",
	"CursorLineNr",
	"LineNrAbove",
	"LineNrBelow",
}

local function set_transparent_background()
	for _, group in ipairs(transparent_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
	end
end

set_transparent_background()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_transparent_background,
})
