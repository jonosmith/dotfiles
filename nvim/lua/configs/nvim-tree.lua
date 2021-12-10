local present, tree = pcall(require, "nvim-tree")
if not present then
	return
end

local M = {}

local tree_cb = require("nvim-tree.config").nvim_tree_callback

function M.setup()
	tree.setup({
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		view = {
			width = 40,
			mappings = {
				list = {
					{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
					{ key = "h", cb = tree_cb("close_node") },
					{ key = "v", cb = tree_cb("vsplit") },
					{ key = "C", cb = tree_cb("cd") },
					{ key = "sf", cb = "<cmd>lua require'configs.nvim-tree'.start_telescope('find_files')<cr>" },
					{ key = "st", cb = "<cmd>lua require'configs.nvim-tree'.start_telescope('live_grep')<cr>" },
				},
			},
		},
		diagnostics = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		show_icons = {
			git = 1,
			folders = 1,
			files = 1,
			folder_arrows = 1,
			tree_width = 30,
		},
		icons = {
			default = "",
			symlink = "",
			git = {
				unstaged = "",
				staged = "S",
				unmerged = "",
				renamed = "➜",
				deleted = "",
				untracked = "U",
				ignored = "◌",
			},
			folder = {
				default = "",
				open = "",
				empty = "",
				empty_open = "",
				symlink = "",
			},
		},
	})
end

function M.start_telescope(telescope_mode)
	local node = require("nvim-tree.lib").get_node_at_cursor()
	local abspath = node.link_to or node.absolute_path
	local is_folder = node.open ~= nil
	local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
	require("telescope.builtin")[telescope_mode]({
		cwd = basedir,
	})
end

return M
