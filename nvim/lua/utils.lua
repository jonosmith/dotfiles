local api = vim.api
local cmd = api.nvim_command

local M = {}

M.create_augroup = function(name, autocmds)
	cmd = vim.cmd

	cmd("augroup " .. name)
	cmd("autocmd!")
	for _, autocmd in ipairs(autocmds) do
		cmd("autocmd " .. table.concat(autocmd, " "))
	end

	cmd("augroup END")
end

-- Key mapping
M.map = function(mode, keys, cmd, opt)
	local options = { noremap = true, silent = true }
	if opt then
		options = vim.tbl_extend("force", options, opt)
	end

	-- all valid modes allowed for mappings
	-- :h map-modes
	local valid_modes = {
		[""] = true,
		["n"] = true,
		["v"] = true,
		["s"] = true,
		["x"] = true,
		["o"] = true,
		["!"] = true,
		["i"] = true,
		["l"] = true,
		["c"] = true,
		["t"] = true,
	}

	-- helper function for M.map
	-- can gives multiple modes and keys
	local function map_wrapper(mode, lhs, rhs, options)
		if type(lhs) == "table" then
			for _, key in ipairs(lhs) do
				map_wrapper(mode, key, rhs, options)
			end
		else
			if type(mode) == "table" then
				for _, m in ipairs(mode) do
					map_wrapper(m, lhs, rhs, options)
				end
			else
				if valid_modes[mode] and lhs and rhs then
					vim.api.nvim_set_keymap(mode, lhs, rhs, options)
				else
					mode, lhs, rhs = mode or "", lhs or "", rhs or ""
					print(
						"Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]"
					)
				end
			end
		end
	end

	map_wrapper(mode, keys, cmd, options)
end

-- For moments when I don't want my cursor to stay on the tree
M.move_cursor_from_tree = function()
	if api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
		cmd("wincmd l")
	end
end

-- Escape terminal codes
-- https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
-- https://github.com/folke/which-key.nvim/issues/125
M.escapeTermCodes = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M
