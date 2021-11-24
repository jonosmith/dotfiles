local present, wk = pcall(require, "which-key")
if not present then
	return
end

wk.setup({
	plugins = {
		presets = {
			-- Don't want the popup occuring on frequently used common operators
			operators = false,
		},
	},
	window = {
		border = "none",
	},
})
