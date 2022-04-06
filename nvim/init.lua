vim.g.mapleader = " "
vim.g.camelcasemotion_key = "<leader>"

local o = vim.o -- editor options (:set)
local wo = vim.wo -- window scoped options (:setlocal)

o.termguicolors = true
o.winblend = 0
o.wildoptions = "pum"
o.pumblend = 5
o.syntax = "on"

-- Basic config
o.mouse = "a"
o.clipboard = "unnamed"
o.hidden = true
o.number = true
o.relativenumber = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.ignorecase = true
o.smartcase = true
o.autoindent = true
o.copyindent = true
o.showmode = false
o.history = 1000
o.undolevels = 1000
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undo"
o.cursorline = true
o.scrolloff = 8
o.sidescrolloff = 8
o.updatetime = 300
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99

wo.number = true
wo.signcolumn = "yes"
wo.wrap = false

-- Change some of the signs that appear in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.scrollview_current_only = true
vim.g.symbols_outline = {
	width = 60,
	auto_preview = false,
}

-- Set theme
o.background = "dark"
require("themes").solarized()

-- Begin main initialization
require("init")
