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
o.list = true
o.listchars = "tab:▶ ,trail:.,nbsp:+"
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

wo.number = true
wo.signcolumn = "yes"
wo.wrap = false

vim.g.nvim_tree_highlight_opened_files = 1


-- Begin main initialization
require("init")

-- Set theme
o.background = "dark"
require("themes").setNeoSolarized()
