local u = require("utils")

u.create_augroup("Format", {
	-- Format on save
	{ "BufWritePre", "*", "lua vim.lsp.buf.formatting_sync(nil, 1000)" },
	-- Turn off inline git blame by default
	{ "VimEnter", "*", "VGit toggle_buffer_blames" },
})
