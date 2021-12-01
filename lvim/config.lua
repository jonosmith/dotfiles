--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

-- Default values: https://github.com/LunarVim/LunarVim/blob/ffcaae6c32fb10c7716dde2593e30bdf044719db/lua/lvim/config/settings.lua

vim.o.timeoutlen = 500
vim.o.hidden = true
lvim.log.level = "warn"
lvim.format_on_save = false

-- Set theme
vim.o.background = "dark"
lvim.colorscheme = "nordfox"

--------------------------------------------------------------------------------
-- Mappings
--------------------------------------------------------------------------------

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

-- Toggleterm
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-n>"

-- Override the whole "g" block due to conflicts with existing git diff (<leader>gd)
lvim.builtin.which_key.mappings["g"] = {
	name = "Git",
	j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
	p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
	r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
	R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
	u = {
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		"Undo Stage Hunk",
	},
	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	C = {
		"<cmd>Telescope git_bcommits<cr>",
		"Checkout commit(for current file)",
	},
	d = {
		name = "Git Diff",
		d = { "<cmd>DiffviewOpen <CR>", "Git DiffView Open" },
		h = { "<cmd>DiffviewFileHistory <CR>", "Git File History" },
		c = { "<cmd>DiffviewClose <CR>", "Git DiffView Close" },
		D = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
}

-- Spectre search
lvim.builtin.which_key.mappings["S"] = {
	name = "Spectre Search",
	s = { ":lua require('spectre').open()<CR>", "Open Search Panel" },
	f = { "viw:lua require('spectre').open_file_search()<CR>", "Search Within File" },
}

--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------

lvim.autocommands.custom_groups = {
	-- -- Default error red is too bright
	-- { "ColorScheme", "*", "hi DiagnosticError guifg=#ec5f67" },
	-- { "ColorScheme", "*", "hi DiagnosticUnderlineError guisp=#ec5f67" },
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
lvim.builtin.telescope.pickers = { find_files = { hidden = true } }
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "dotbot" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.incremental_selection = {
	enable = true,
	keymaps = {
		init_selection = "<CR>",
		scope_incremental = "<CR>",
		node_incremental = "<TAB>",
		node_decremental = "<S-TAB>",
	},
}


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

	{
		"windwp/nvim-spectre",
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"plasticboy/vim-markdown",
		requires = "godlygeek/tabular",
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{ "rktjmp/lush.nvim" },
  { "cocopon/inspecthi.vim" },

	-- Themes
	{ "folke/tokyonight.nvim" },
	{ "NLKNguyen/papercolor-theme" },
	{ "marko-cerovac/material.nvim" },
	{ "ishan9299/nvim-solarized-lua" },
	{ "mhartington/oceanic-next" },
  { "sainnhe/sonokai" },
	{
		"EdenEast/nightfox.nvim"
	},
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
