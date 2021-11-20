local utils = require "utils"

local map = utils.map

map("n", "<C-F>f", "<Plug>CtrlSFPrompt", { noremap = false })
map("n", "<C-F>n", "<Plug>CtrlSFCwordPath", { noremap = false })
map("n", "<C-F>p", "<Plug>CtrlSFPwordPath", { noremap = false })

