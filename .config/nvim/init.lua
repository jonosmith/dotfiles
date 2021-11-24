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
o.tabstop = 2 -- a tab is 2 spaces
o.softtabstop = 2 -- when hitting <BS>, pretend like a tab is removed, even if spaces
o.shiftwidth = 2 -- number of spaces to use for autoindenting
o.expandtab = true -- expand tabs to spaces
o.smartcase = true
o.autoindent = true
o.copyindent = true
o.showmode = false -- lightline shows hits already
o.history = 1000
o.undolevels = 1000

wo.number = true -- display line numbers
wo.signcolumn = "yes"
wo.wrap = false

vim.g.nvim_tree_highlight_opened_files = 1

-- Begin main initialization
require("init")

-- Set theme
o.background = "dark"
require("themes").setSolarized()
