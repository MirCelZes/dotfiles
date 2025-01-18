vim.g.mapleader = " "
vim.g.localleader = "\\"

-- :help vim.keymap.set
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- mode:
-- n - normal
-- i - insert
-- v - visual
-- c - command
-- r - replace
-- t - terminal
-- s - substitute
local mappings = {
	-- window
	{ "n", "<leader>h", ":leftabove vsplit | wincmd h<CR>", { desc = "Split a window to left" } },
	{ "n", "<leader>j", ":botright split | wincmd j<CR>", { desc = "Split a window to bottom" } },
	{ "n", "<leader>k", ":topleft split | wincmd k<CR>", { desc = "Split a window to above" } },
	{ "n", "<leader>l", ":rightbelow vsplit | wincmd l<CR>", { desc = "Split a window to right" } },

	{ { "n", "i", "v" }, "<M-w>h", ":wincmd h<CR>", { desc = "Go to left window" } }, 
	{ { "n", "i", "v" }, "<M-w>j", ":wincmd j<CR>", { desc = "Go to below window" } }, 
	{ { "n", "i", "v" }, "<M-w>k", ":wincmd k<CR>", { desc = "Go to above window" } },
	{ { "n", "i", "v" }, "<M-w>l", ":wincmd l<CR>", { desc = "Go to right window" } },

	{ { "n", "i", "v" }, "<S-W>h", ":vertical resize +1<CR>", { desc = "Increase window height" } },
	{ { "n", "i", "v" }, "<S-W>j", ":resize -1<CR>", { desc = "Increase window size" } },
	{ { "n", "i", "v" }, "<S-W>k", ":resize +1<CR>", { desc = "Increase window size" } },
	{ { "n", "i", "v" }, "<S-W>l", ":vertical resize -1<CR>", { desc = "Decrease window weight" } },
	
	{ { "n", "i" }, "<M-j>", "<ESC>:move .+1<CR>==", { desc = "Move current line down" } },
	{ { "n", "i" }, "<M-k>", "<ESC>:move .-2<CR>==", { desc = "Move current line up" } },
	{ "v", "<M-j>", ":'<,'>move '>+<CR>gv=gv", { desc = "Move selected lines up" } },
	{ "v", "<M-k>", ":'<,'>move '<-2<CR>gv=gv", { desc = "Move selected lines down" } },

	{ { "n", "i", "v" }, "<M-[>", ":bprevious<CR>", { desc = "Go to previous buffer" } },
	{ { "n", "i", "v" }, "<M-]>", ":bnext<CR>", { desc = "Go to next buffer" } },

	-- clear highlights on search when pressing <ESC>
	{ "n", "<ESC>", ":nohlsearch<CR>", { noremap = false } }
	-- tab
}

-- default opts:
-- nowait = true
local shared_opts = { noremap = true, silent = true }

for _, entry in ipairs(mappings) do
	local modes, lhs, rhs, entry_opts = unpack(entry)
	opts = vim.tbl_deep_extend("force", shared_opts, entry_opts or {})
	vim.keymap.set(modes, lhs, rhs, opts)
end

