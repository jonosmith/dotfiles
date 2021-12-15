local present, cmp = pcall(require, "cmp")
if not present then
	return
end

vim.o.completeopt = "menu,menuone,noselect"

require("cmp-npm").setup({})

local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
		}),
	},
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
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

