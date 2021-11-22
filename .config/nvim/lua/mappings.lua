local wk = require("which-key")
local utils = require("utils")

local map = utils.map

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

-- Completion
vim.cmd([[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
vim.cmd([[inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])

-- Nvim Tree
wk.register({
	["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Tree Toggle" },
	["<leader>t"] = {
		name = "Nvim Tree",
		r = { "<cmd>NvimTreeRefresh<CR>", "Refresh" },
		f = { "<cmd>NvimTreeFindFile<CR>", "Find File" },
	},
})

-- Bufferline Tabs
wk.register({
	["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "Next Tab" },
	["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous Tab" },
})

-- LSP
-- See `:help vim.lsp.*` for documentation on any of the below functions
wk.register({
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover info" },
	gD = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
	gd = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
	gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
	gr = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
	["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
	["<leader>"] = {
		F = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
		o = { "<cmd>SymbolsOutline <CR>", "Symbols Outline" },
	},
})

-- Diagnostics
wk.register({
	["["] = {
		d = { ":lua vim.lsp.diagnostic.goto_prev()<CR>", "Previous Diagnostic Message" },
	},
	["]"] = {
		d = { ":lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic Message" },
	},
})
wk.register({
	["<leader>"] = {
		q = { "<cmd>CodeActionMenu<CR>", "Quickfix" },
		d = {
			name = "Diagnostics",
			d = { "<cmd>Trouble<CR>", "Toggle Diagnostics List" },
			l = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Line Diagnostics" },
			r = { "<cmd>Trouble lsp_references<CR>", "Diagnostic References" },
		},
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
	["<leader>v"] = {
		name = "Git",
		d = { "<cmd>DiffviewOpen <CR>", "DiffView Open" },
		h = { "<cmd>DiffviewFileHistory <CR>", "File History" },
		x = { "<cmd>DiffviewClose <CR>", "DiffView Close" },
	},
})

-- Telescope
wk.register({
	["<leader>f"] = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files <CR>", "Files" },
		s = { "<cmd>Telescope live_grep <CR>", "Search" },
		r = { "<cmd>Telescope relative_grep <CR>", "Relative Search" },
		a = { "<cmd>Telescope find_files hidden=true <CR>", "Hidden Files" },
		m = { "<cmd>Telescope media_files <CR>", "Media Files" },
		d = { "<cmd>Telescope dotfiles <CR>", "Dotfiles" },
		b = { "<cmd>Telescope buffers <CR>", "Buffers" },
		p = { "<cmd>Telescope projects <CR>", "Projects" },
		h = { "<cmd>Telescope help_tags <CR>", "Help Tags" },
		["/"] = { "<cmd>Telescope search_history <CR>", "Help Tags" },
		q = { "<cmd>Telescope quickfix <CR>", "Quickfix" },
		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches <CR>", "Git Branches" },
			c = { "<cmd>Telescope git_commits <CR>", "Git Commits" },
			t = { "<cmd>Telescope git_buffer_commits <CR>", "Git Buffer Commits" },
			s = { "<cmd>Telescope git_status <CR>", "Git Status" },
		},
	},
})

-- Navigation
wk.register({
	["<leader>"] = {
		h = { ":wincmd h<CR>", "Window Left" },
		j = { ":wincmd j<CR>", "Window Down" },
		k = { ":wincmd k<CR>", "Window Up" },
		l = { ":wincmd l<CR>", "Window Right" },
		["+"] = { ":vertical resize +5<CR>", "Vertical Resize +5" },
		["-"] = { ":vertical resize -5<CR>", "Vertical Resize -5" },
	},
})

-- Comments
wk.register({
	["<leader>/"] = { "<cmd>CommentToggle <CR>", "Comment Line" },
})
wk.register({
	["<leader>/"] = { ":<C-u>call CommentOperator(visualmode())<CR>", "Comment Line" },
}, { mode = "v" })

-- Other

-- Esc also clears any highlighted text
map("n", "<Esc>", "<cmd>let @/=''<CR>")

wk.register({
	["<C-a>"] = { "gg<S-v>G", "Select All" },
	["<leader>x"] = { "<cmd>Bdelete<CR>", "Close Buffer" },
	["\\r"] = { "<cmd>:source $MYVIMRC<CR>", "Reload vimrc file" },
})
