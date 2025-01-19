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
	{ "n", "<leader>h", ":leftabove vsplit | wincmd h<cr>", { desc = "Split a window to left" } },
	{ "n", "<leader>j", ":botright split | wincmd j<cr>", { desc = "Split a window to bottom" } },
	{ "n", "<leader>k", ":topleft split | wincmd k<cr>", { desc = "Split a window to above" } },
	{ "n", "<leader>l", ":rightbelow vsplit | wincmd l<cr>", { desc = "Split a window to right" } },

	{ { "n", "i", "v" }, "<M-w>h", ":wincmd h<cr>", { desc = "Go to left window" } },
	{ { "n", "i", "v" }, "<M-w>j", ":wincmd j<cr>", { desc = "Go to below window" } },
	{ { "n", "i", "v" }, "<M-w>k", ":wincmd k<cr>", { desc = "Go to above window" } },
	{ { "n", "i", "v" }, "<M-w>l", ":wincmd l<cr>", { desc = "Go to right window" } },

	{ { "n", "i", "v" }, "<S-W>h", ":vertical resize +1<cr>", { desc = "Increase window height" } },
	{ { "n", "i", "v" }, "<S-W>j", ":resize -1<cr>", { desc = "Increase window size" } },
	{ { "n", "i", "v" }, "<S-W>k", ":resize +1<cr>", { desc = "Increase window size" } },
	{ { "n", "i", "v" }, "<S-W>l", ":vertical resize -1<cr>", { desc = "Decrease window weight" } },
	
	{ { "n", "i" }, "<M-j>", "<esc>:move .+1<cr>==", { desc = "Move current line down" } },
	{ { "n", "i" }, "<M-k>", "<esc>:move .-2<cr>==", { desc = "Move current line up" } },
	{ "v", "<M-j>", ":'<,'>move '>+<cr>gv=gv", { desc = "Move selected lines up" } },
	{ "v", "<M-k>", ":'<,'>move '<-2<cr>gv=gv", { desc = "Move selected lines down" } },

	{ { "n", "i", "v" }, "<M-[>", ":bprevious<cr>", { desc = "Go to previous buffer" } },
	{ { "n", "i", "v" }, "<M-]>", ":bnext<cr>", { desc = "Go to next buffer" } },

	-- tab
	{ "n", "<leader><tab>n", ":tabnew<cr>", { desc = "Create new tab" } },
	{ "n", "<leader><tab>o", ":tabonly<cr>", { desc = "Close other tab" } },
	{ "n", "<leader><tab>d", ":tabclose<cr>", { desc = "Close current tab" } },
	{ "n", "<tab>[", ":tabprevious<cr>", { desc = "Go to previous tab" } },
	{ "n", "<tab>]", ":tabnext<cr>", { desc = "Go to next tab" } },

	-- clear highlights on search when pressing <esc>
	{ "n", "<esc>", ":nohlsearch<cr>", { noremap = false } }
	
}

-- default opts:
-- nowait = true
local shared_opts = { noremap = true, silent = true }

for _, entry in ipairs(mappings) do
	local modes, lhs, rhs, entry_opts = unpack(entry)
	opts = vim.tbl_deep_extend("force", shared_opts, entry_opts or {})
	vim.keymap.set(modes, lhs, rhs, opts)
end

