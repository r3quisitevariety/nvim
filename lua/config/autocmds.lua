-- i have no idea what this is but its needed for autocmds like highlight on yank
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- autodetects change in current file
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
	group = vim.api.nvim_create_augroup("AutoReload", { clear = true }),
	callback = function()
		vim.cmd.checktime()
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		if vim.fn.has("nvim-0.13") == 1 then
			vim.hl.hl_op()
		else
			(vim.hl or vim.highlight).on_yank()
		end
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- transparent rules
local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"SignColumn",
	"StatusLine",
	"StatusLineNC",
	"TabLine",
	"TabLineFill",
	"TabLineSel",
	"EndOfBuffer",
	"NeoTreeNormal",
	"NeoTreeNormalNC",
	"LineNr",
	"CursorLineNr",
	"LineNrAbove",
	"LineNrBelow",
	"GitSignsAdd",
	"GitSignsChange",
	"GitSignsDelete",
	"GitSignsChangedelete",
	"GitSignsTopdelete",
	"GitSignsUntracked",
	"GitSignsCurrentLineBlame",
	"WinSeparator",
	"VertSplit",
	"FoldColumn",
	"Folded",
	"ColorColumn",
	"WinBar",
	"WinBarNC",
	"FloatBorder",
	"FloatTitle",
	"MsgArea",
	"NormalSB",
}

local function set_transparent_background()
	for _, group in ipairs(transparent_groups) do
		local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
		highlight.bg = "NONE"
		highlight.ctermbg = "NONE"
		vim.api.nvim_set_hl(0, group, highlight)
	end

	for group, highlight in pairs(vim.api.nvim_get_hl(0, {})) do
		if group:match("^Telescope") then
			highlight.bg = "NONE"
			highlight.ctermbg = "NONE"
			vim.api.nvim_set_hl(0, group, highlight)
		end
	end

	for _, group in ipairs(vim.fn.getcompletion("BufferLine", "highlight")) do
		local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
		highlight.bg = "NONE"
		highlight.ctermbg = "NONE"
		vim.api.nvim_set_hl(0, group, highlight)
	end
end

set_transparent_background()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_transparent_background,
})
