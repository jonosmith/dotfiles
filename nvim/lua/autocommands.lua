local u = require("utils")

u.create_augroup("Format", {
	{ "BufWritePre", "*", "lua vim.lsp.buf.formatting_sync(nil, 1000)" },
})
