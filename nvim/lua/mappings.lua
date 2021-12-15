local wk = require("which-key")
local utils = require("utils")

local map = utils.map
local t = utils.escapeTermCodes

-- Basics

-- Esc also clears any highlighted text
map("n", "<Esc>", "<cmd>let @/=''<CR>")

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Shift + J/K moves selected lines down/up in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

wk.register({
	["<C-a>"] = { "gg<S-v>G", "Select All" },
	["<C-s>"] = { "<cmd>:w<CR>", "Save Buffer" },
	["<leader>c"] = { "<cmd>Bdelete<CR>", "Close Buffer" },
	["\\r"] = { "<cmd>:source $MYVIMRC<CR>", "Reload vimrc file" },

	-- Vim settings
	["<leader>v"] = {
		name = "Vim",
		c = { "<cmd>edit ~/.config/nvim/init.lua<CR>", "Edit Config" },
		r = { "<cmd>source ~/.config/nvim/init.lua<CR>", "Reload Config" },
	},
})

-- Set up some group names
wk.register({
	["["] = {
		name = "Previous",
	},
	["]"] = {
		name = "Next",
	},
	["\\"] = {
		name = "Tools",
	},
})

-- Nvim Tree
wk.register({
	["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Tree Toggle" },
	["<leader>n"] = {
		name = "Nvim Tree",
		r = { "<cmd>NvimTreeRefresh<CR>", "Refresh" },
		f = { "<cmd>NvimTreeFindFile<CR>", "Find File" },
	},
})

-- LSP
-- See `:help vim.lsp.*` for documentation on any of the below functions
wk.register({
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover info" },
	gD = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
	gd = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
	gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
	gr = { "<cmd>Telescope lsp_references<CR>", "References" },
	gs = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },

	["<leader>l"] = {
		name = "LSP",
		a = { "<cmd>CodeActionMenu<CR>", "Code Action" },
		f = { "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", "Format" },
		o = { "<cmd>TSLspOrganize<CR>", "Organize Imports" },
		i = { "<cmd>TSLspImportCurrent<CR>", "Import Missing Symbol Under Cursor" },
		I = { "<cmd>TSLspImportAll<CR>", "Import All Missing Symbols" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
		R = { "<cmd>TSLspRenameFile<CR>", "Rename File " },
		D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
		s = { "<cmd>SymbolsOutline <CR>", "Symbols Outline" },
		d = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Line Diagnostics" },
		t = {
			name = "Trouble",
			t = { "<cmd>TroubleToggle<CR>", "Toggle Diagnostics List" },
			r = { "<cmd>Trouble lsp_references<CR>", "Diagnostic References" },
		},
	},

	["["] = {
		d = { ":lua vim.lsp.diagnostic.goto_prev()<CR>", "Previous Diagnostic Message" },
	},
	["]"] = {
		d = { ":lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic Message" },
	},
})

-- Workspaces
wk.register({
	["\\w"] = {
		name = "Workspaces",
		a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace" },
		r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace" },
		l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspaces" },
	},
})

-- Git
wk.register({
	["<leader>g"] = {
		d = { "<cmd>DiffviewOpen <CR>", "Git DiffView Open" },
		h = { "<cmd>DiffviewFileHistory <CR>", "Git File History" },
		c = { "<cmd>DiffviewClose <CR>", "Git DiffView Close" },
	},
})

-- Toggleterm
wk.register({
	["<C-f>"] = { "<cmd>lua ToggleFloatingTerm()<CR>", "Toggle Floating Terminal" },
})
wk.register({
	["<C-f>"] = { "<cmd>lua ToggleFloatingTerm()<CR>", "Toggle Floating Terminal" },
	["<Esc>"] = { t("<C-\\><C-N>"), "Escape" },
}, { mode = "t" })

-- Telescope
wk.register({
	["<leader>f"] = { "<cmd>Telescope find_files <CR>", "Files" },
	["<leader>s"] = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files <CR>", "Files" },
		a = { "<cmd>Telescope find_files hidden=true no_ignore=true <CR>", "All Files" },
		t = { "<cmd>Telescope live_grep <CR>", "Text" },
		r = { "<cmd>Telescope relative_grep <CR>", "Relative Search" },
		m = { "<cmd>Telescope media_files <CR>", "Media Files" },
		b = { "<cmd>Telescope buffers <CR>", "Buffers" },
		p = { "<cmd>Telescope projects <CR>", "Projects" },
		h = { "<cmd>Telescope help_tags <CR>", "Help Tags" },
		["/"] = { "<cmd>Telescope search_history <CR>", "Help Tags" },
		q = { "<cmd>Telescope quickfix <CR>", "Quickfix" },
		la = { "<cmd>Telescope lsp_code_actions<CR>", "Code Actions" },
		lr = { "<cmd>Telescope lsp_references<CR>", "References" },
		d = {
			name = "Diagnostics",
			d = { "<cmd>Telescope lsp_document_diagnostics<CR>", "Document Errors" },
			w = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace Errors" },
		},
		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches <CR>", "Git Branches" },
			c = { "<cmd>Telescope git_commits <CR>", "Git Commits" },
			t = { "<cmd>Telescope git_buffer_commits <CR>", "Git Buffer Commits" },
			k = { "<cmd>Telescope git_status <CR>", "Git Status" },
			s = { "<cmd>Telescope git_stash<CR>", "Git Stash" },
		},
	},
})

-- Navigation
wk.register({
	["<C-h>"] = { ":wincmd h<CR>", "Window Left" },
	["<C-j>"] = { ":wincmd j<CR>", "Window Down" },
	["<C-k>"] = { ":wincmd k<CR>", "Window Up" },
	["<C-l>"] = { ":wincmd l<CR>", "Window Right" },
})

-- Comments
wk.register({
	["<leader>/"] = { "<cmd>CommentToggle <CR>", "Comment Line" },
})
wk.register({
	["<leader>/"] = { ":<C-u>call CommentOperator(visualmode())<CR>", "Comment Line" },
}, { mode = "v" })

-- Visual Undo History
wk.register({
	["<leader>u"] = { "<cmd>MundoToggle<CR>", "Toggle Undo Tree" },
})

-- Buffers
wk.register({
	["<leader>w"] = { "<cmd>:w<CR>", "Save Buffer" },
	["<S-h>"] = { "<cmd>BufferPrev<CR>", "Previous Buffer" },
	["<S-l>"] = { "<cmd>BufferNext<CR>", "Previous Next" },
	["<leader>b"] = {
		name = "Buffers",
		j = { "<cmd>BufferPick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers<cr>", "Find" },
		b = { "<cmd>b#<cr>", "Previous" },
		w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
		e = {
			"<cmd>BufferCloseAllButCurrent<cr>",
			"Close all but current",
		},
		h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
		l = {
			"<cmd>BufferCloseBuffersRight<cr>",
			"Close all to the right",
		},
		D = {
			"<cmd>BufferOrderByDirectory<cr>",
			"Sort by directory",
		},
		L = {
			"<cmd>BufferOrderByLanguage<cr>",
			"Sort by language",
		},
	},
})

-- Packer
wk.register({
	["<leader>p"] = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
})

-- Vim Test
wk.register({
	["<leader>t"] = {
		name = "Vim Test",
		n = { "<cmd>TestNearest<CR>", "Test Nearest" },
		f = { "<cmd>TestFile<CR>", "Test File" },
		s = { "<cmd>TestSuite<CR>", "Test Suite" },
		l = { "<cmd>TestLast<CR>", "Test Last" },
		v = { "<cmd>TestVisit<CR>", "Test Visit" },
	},
})
