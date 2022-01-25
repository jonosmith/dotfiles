local present, toggleterm = pcall(require, "toggleterm")
if not present then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

local floatingTerm = Terminal:new({
	hidden = true,
	direction = "float",
	float_opts = {
		border = "rounded",
		highlights = {
			background = "DarkenedPanel",
		},
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

local gituiTerm = Terminal:new({
	cmd = "gitui -t solarized_dark.ron",
	dir = "git_dir",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "rounded",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

function ToggleFloatingTerm()
	floatingTerm:toggle()
end

function ToggleGituiTerm()
	gituiTerm:toggle()
end

toggleterm.setup({
	open_mapping = [[<C-t>]],
})
