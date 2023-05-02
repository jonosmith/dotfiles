local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

-- Hover doc popup
local pop_opts = { border = "single" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

local common_on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- formatting
	if
		client.name == "tsserver"
		or client.name == "jsonls"
		or client.name == "pyright"
		or client.name == "lua_ls"
	then
		client.resolved_capabilities.document_formatting = false
	end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.tsserver.setup({
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local ts_utils = require("nvim-lsp-ts-utils")

		ts_utils.setup({})
		ts_utils.setup_client(client)

		common_on_attach(client, bufnr)
	end,
})

lspconfig.graphql.setup({
	on_attach = common_on_attach,
	root_dir = lspconfig.util.root_pattern(".graphql*", ".git", "package.json"),
	filetypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
		"graphql",
	},
})

lspconfig.lua_ls.setup({
	on_attach = common_on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "lvim" },
			},
		},
	},
})

lspconfig.pyright.setup({
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				diagnosticSeverityOverrides = {
					reportGeneralTypeIssues = "error",
					reportMissingTypeStubs = "information",
				},
			},
		},
	},
})

lspconfig.cssls.setup({
	on_attach = common_on_attach,
	capabilities = capabilities,
})

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 4,
		prefix = "",
	},
	severity_sort = true,
})
