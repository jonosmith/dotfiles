vim.g.mapleader = " "

-- Being main initialization
require "init"

local o = vim.o
local wo = vim.wo

-- Basic config
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true -- display line numbers
wo.signcolumn = 'yes'
wo.wrap = false

-- Set theme
o.termguicolors = true
o.winblend = 0
o.wildoptions = "pum"
o.pumblend = 5
vim.g.neosolarized_termtrans = 1
vim.cmd("colorscheme NeoSolarized")
