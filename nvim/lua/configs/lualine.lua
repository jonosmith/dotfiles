local present, lualine = pcall(require, "lualine")
if not present then
	return
end

lualine.setup({
	options = {
		theme = vim.g.colorscheme or "auto",
	},
	extensions = { "nvim-tree" },
})
