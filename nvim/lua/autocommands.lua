local u = require("utils")

function RestartGraphqlLanguageServer()
	local activeLSPs = vim.lsp.get_active_clients()
	-- print(vim.inspect.inspect(activeLSPs))

	local hasGraphqlLSP = false
	for index, data in ipairs(activeLSPs) do
		if data.name == "graphql" then
			hasGraphqlLSP = true
		end
	end

	if hasGraphqlLSP then
		vim.cmd("edit")
	end
end

u.create_augroup("Format", {
	-- Format on save
	{ "BufWritePre", "*", "lua vim.lsp.buf.formatting_sync(nil, 1000)" },
	-- Turn off inline git blame by default
	{ "VimEnter", "*", "VGit toggle_live_blame" },
	-- Graphql language server is flaky and stops running on write so we need to
	-- trigger a restart
	{ "BufWritePost", "*", "lua RestartGraphqlLanguageServer()" },
})
