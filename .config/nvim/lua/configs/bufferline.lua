local present, bufferline = pcall(require, "bufferline")
if not present then
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
		separator_style = "slant",
	},
})
