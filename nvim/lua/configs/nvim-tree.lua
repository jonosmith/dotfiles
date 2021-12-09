local present, tree = pcall(require, "nvim-tree")
if not present then
	return
end

tree.setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 35,
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
