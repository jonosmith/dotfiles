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
			background = "NormalFloat",
			border = "FloatBorder",
		},
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

toggleterm.setup({
	open_mapping = [[<C-t>]],
})
