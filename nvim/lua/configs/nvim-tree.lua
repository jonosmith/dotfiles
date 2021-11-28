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
})
