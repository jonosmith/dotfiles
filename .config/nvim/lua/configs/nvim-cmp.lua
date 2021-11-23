local present, cmp = pcall(require, "cmp")

if not present then
	return
end

vim.o.completeopt = "menu,menuone,noselect"

require("cmp-npm").setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "npm", keyword_length = 1 },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
for _, name in pairs(lspconfig.available_servers()) do
  lspconfig[name].setup({
    capabilities = capabilities
  })
end
