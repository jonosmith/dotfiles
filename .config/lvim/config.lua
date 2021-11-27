--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

-- Default values: https://github.com/LunarVim/LunarVim/blob/ffcaae6c32fb10c7716dde2593e30bdf044719db/lua/lvim/config/settings.lua

vim.o.timeoutlen = 500
vim.o.hidden = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
lvim.log.level = "warn"
lvim.format_on_save = true

vim.o.background = "dark"
lvim.colorscheme = "solarized"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- Save buffer
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G" -- Select all text
lvim.keys.normal_mode["<Esc>"] = "<cmd>let @/=''<CR>" -- Escape also clears any highlights
lvim.keys.normal_mode["]d"] = ":lua vim.lsp.diagnostic.goto_next()<CR>"
lvim.keys.normal_mode["[d"] = ":lua vim.lsp.diagnostic.goto_prev()<CR>"
lvim.keys.normal_mode["gpd"] = ":lua require('goto-preview').goto_preview_definition()<CR>"
lvim.keys.normal_mode["gpi"] = ":lua require('goto-preview').goto_preview_implementation()<CR>"
lvim.keys.normal_mode["gpc"] = ":lua require('goto-preview').close_all_win()<CR>"
lvim.keys.normal_mode["gpr"] = ":lua require('goto-preview').goto_preview_references()<CR>"

lvim.builtin.which_key.mappings["lo"] = { "<cmd>OrganizeImports<CR>", "Organize Imports" }
lvim.builtin.which_key.mappings["u"] = { "<cmd>MundoToggle<CR>", "Toggle Undo Tree" }
lvim.builtin.which_key.mappings["gdd"] = { "<cmd>DiffviewOpen <CR>", "Git DiffView Open" }
lvim.builtin.which_key.mappings["gdh"] = { "<cmd>DiffviewFileHistory <CR>", "Git File History" }
lvim.builtin.which_key.mappings["gdc"] = { "<cmd>DiffviewClose <CR>", "Git DiffView Close" }

--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------

lvim.autocommands.custom_groups = {
	{ "BufWritePre", "*.ts*", "OrganizeImports" },
	{ "BufWritePre", "*.js*", "OrganizeImports" },
	{ "BufWinEnter", "*", "silent! %foldopen!" },
}

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.lualine.style = "default"
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
-- Builtin plugins: https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/plugins.lua
lvim.plugins = {
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "bkad/CamelCaseMotion" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "editorconfig/editorconfig-vim" },
	{
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "simnalamburt/vim-mundo" },
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	},

	-- Themes
	{ "folke/tokyonight.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "NLKNguyen/papercolor-theme" },
	{ "marko-cerovac/material.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "ishan9299/nvim-solarized-lua" },
}

--------------------------------------------------------------------------------
-- Custom LSP Setup
--------------------------------------------------------------------------------

vim.list_extend(lvim.lsp.override, { "tsserver" })

-- Organize imports command
-- See: https://www.reddit.com/r/neovim/comments/lwz8l7/how_to_use_tsservers_organize_imports_with_nvim/
local function ts_organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	vim.lsp.buf.execute_command(params)
end

require("lvim.lsp.manager").setup("tsserver", {
	commands = {
		OrganizeImports = {
			ts_organize_imports,
			description = "Organize Imports",
		},
	},
})

-- Custom on_attach function
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(_, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

--------------------------------------------------------------------------------
-- Formatting and Linting
--------------------------------------------------------------------------------

-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "prettier",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
	{
		exe = "eslint_d",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
	{
		exe = "stylua",
		filetypes = { "lua" },
	},
})

-- Linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		exe = "eslint_d",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
})
