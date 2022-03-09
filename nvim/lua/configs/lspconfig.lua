local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local lsp_installer = require("nvim-lsp-installer")

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
	if client.name == "tsserver" or client.name == "jsonls" or client.name == "pyright" then
		client.resolved_capabilities.document_formatting = false
	end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = common_on_attach,
		capabilities = capabilities,
	}

	if server.name == "tsserver" then
		local on_attach = function(client, bufnr)
			local ts_utils = require("nvim-lsp-ts-utils")

			ts_utils.setup({})

			ts_utils.setup_client(client)

			common_on_attach(client, bufnr)
		end

		opts.on_attach = on_attach
	end

	if server.name == "graphql" then
		opts.root_dir = lspconfig.util.root_pattern(".graphql*", ".git", "package.json")
		opts.filetypes = {
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
			"graphql",
		}
	end

	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "lvim" },
				},
			},
		}
	end

	if server.name == "pyright" then
		opts.settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					diagnosticSeverityOverrides = {
						reportMissingTypeStubs = "information",
					},
				},
			},
		}
	end

	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	-- This sets the spacing and the prefix, obviously.
	virtual_text = {
		spacing = 4,
		prefix = "",
	},
})
