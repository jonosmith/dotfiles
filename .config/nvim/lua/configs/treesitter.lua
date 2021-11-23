local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

ts_config.setup({
	ensure_installed = {
	  "html",
	  "css",
	  "scss",
	  "typescript",
	  "javascript",
	  "tsx",
	  "json",
	  "jsdoc",
		"lua",
		"graphql",
		"vim",
		"php",
		"bash",
		"dockerfile",
		"regex",
		"vue",
		"yaml"
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
})
