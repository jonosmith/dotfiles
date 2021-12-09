local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local lsp_installer = require("nvim-lsp-installer")

-- Hover doc popup
--local pop_opts = { border = "rounded", max_width = 80, background = "red" }
--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
--vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

local common_on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- formatting
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
end

lsp_installer.on_server_ready(function(server)
	-- Set up completion using nvim_cmp with LSP source
	--  local capabilities = require('cmp_nvim_lsp').update_capabilities(
	--    vim.lsp.protocol.make_client_capabilities()
	--  )

	local opts = {
		on_attach = common_on_attach,
		-- capabilities = capabilities,
		settings = {},
	}

	if server.name == "tsserver" then
		local function organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
				title = "",
			}
			vim.lsp.buf.execute_command(params)
		end

		opts.commands = {
			OrganizeImports = {
				organize_imports,
				description = "Organize Imports",
			},
		}
		opts.settings.filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
	end

	if server.name == "graphql" then
		opts.root_dir = lspconfig.util.root_pattern(".graphql*", ".git", "package.json")
		opts.settings.filetypes = { "graphql", "typescript", "typescriptreact" }
	end

	if server.name == "sumneko_lua" then
		opts.settings.Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		}
	end

	-- Configure linters and formatters
	-- For available options see: https://github.com/creativenull/diagnosticls-configs-nvim/blob/main/supported-linters-and-formatters.md
	if server.name == "diagnosticls" then
		local on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = true
			common_on_attach(client, bufnr)
		end

		local ignore = { ".git", "dist", "out", "node_modules" }

		opts.on_attach = on_attach
		opts.filetypes = {
			"lua",
			"javascript",
			"javascriptreact",
			"json",
			"typescript",
			"typescriptreact",
			"css",
			"less",
			"scss",
			"markdown",
			"pandoc",
			"graphql",
		}
		opts.init_options = {
			linters = {
				eslint = {
					command = "eslint_d",
					rootPatterns = { ".git" },
					debounce = 100,
					args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
					sourceName = "eslint_d",
					parseJson = {
						errorsRoot = "[0].messages",
						line = "line",
						column = "column",
						endLine = "endLine",
						endColumn = "endColumn",
						message = "[eslint] ${message} [${ruleId}]",
						security = "severity",
					},
					securities = {
						[2] = "error",
						[1] = "warning",
					},
					ignore = ignore,
				},
			},
			filetypes = {
				javascript = "eslint",
				javascriptreact = "eslint",
				typescript = "eslint",
				typescriptreact = "eslint",
			},
			formatters = {
				eslint_d = {
					command = "eslint_d",
					rootPatterns = { ".git" },
					args = { "--stdin", "--stdin-filename", "%filename", "--fix-to-stdout" },
					ignore = ignore,
				},
				prettier = {
					command = "prettierd",
					rootPatterns = { ".git" },
					args = { "%filepath" },
					ignore = ignore,
				},
				stylua = {
					command = "stylua",
					rootPatterns = { ".git" },
					args = { "--stdin-filepath", "%filename", "-" },
					ignore = ignore,
				},
			},
			formatFiletypes = {
				css = "prettier",
				javascript = "prettier",
				javascriptreact = "prettier",
				graphql = "prettier",
				json = "prettier",
				scss = "prettier",
				less = "prettier",
				typescript = "prettier",
				typescriptreact = "prettier",
				markdown = "prettier",
				lua = "stylua",
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
