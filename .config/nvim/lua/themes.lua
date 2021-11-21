M = {}

local o = vim.o
local wo = vim.wo

M.setTheme = function(theme)
	if theme == "tokyonight" then
		vim.cmd("colorscheme tokyonight")
		vim.g.lightline = { colorscheme = "tokyonight" }
	elseif theme == "neosolarized" then
		vim.g.lightline = { colorscheme = "solarized" }
		vim.g.neosolarized_termtrans = 1
		vim.cmd("colorscheme NeoSolarized")
	elseif theme == "solarizedlight" then
		require("solarized").set()
	elseif theme == "oceanicnext" then
		vim.g.oceanic_next_terminal_bold = 0
		vim.cmd("colorscheme OceanicNext")
		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
		vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
		vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
		vim.cmd("highlight NvimTreeFolderIcon guibg=blue")
	elseif theme == "papercolor" then
		vim.g.lightline = { colorscheme = "PaperColor" }
		vim.cmd("colorscheme PaperColor")
	else
		error("Invalid theme specified: '" + theme("'"))
	end
end

return M
