vim.g.mapleader = " "

-- Being main initialization
require("init")

local o = vim.o -- editor options (:set)
local wo = vim.wo -- window scoped options (:setlocal)

-- Basic config
o.tabstop = 2 -- a tab is 2 spaces
o.softtabstop = 2 -- when hitting <BS>, pretend like a tab is removed, even if spaces
o.shiftwidth = 2 -- number of spaces to use for autoindenting
o.expandtab = true -- expand tabs to spaces
o.smartcase = true
o.autoindent = true
o.copyindent = true

o.history = 1000
o.undolevels = 1000

wo.number = true -- display line numbers
wo.signcolumn = "yes"
wo.wrap = false

-- Set theme
o.termguicolors = true
o.winblend = 0
o.wildoptions = "pum"
o.pumblend = 5
vim.g.neosolarized_termtrans = 1
vim.cmd("colorscheme NeoSolarized")
