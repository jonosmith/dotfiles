local U = require("utils")

-- Theme Setters

M = {}

M.tokyoNight = function()
	vim.g.colorscheme = "tokyonight"
	vim.cmd("colorscheme tokyonight")
end

M.oceanicNext = function()
	vim.g.colorscheme = "OceanicNext"

	vim.g.oceanic_next_terminal_bold = 0
	vim.cmd("colorscheme OceanicNext")
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
	vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
	vim.cmd("hi NvimTreeFolderIcon guibg=blue")
	vim.cmd("hi Type guifg=#6699cc gui=NONE")
	vim.cmd("hi DiagnosticError guifg=#ec5f67")
	vim.cmd("hi DiagnosticUnderlineError guisp=#ec5f67")
end

M.paperColor = function()
	if vim.o.background == "light" then
		vim.g.colorscheme = "papercolor_light"
	else
		vim.g.colorscheme = "papercolor_dark"
	end

	vim.cmd("colorscheme PaperColor")
	vim.cmd("hi BufferInactive guifg=#eeeeee guibg=#005f87")
end

-- @param variant string - "zenbones" | "zenwritten" | "neobones" | "vimbones" | "rosebones" | "forestbones" | "nordbones" | "tokyobones" | "seoulbones" | "duckbones" | "zenburned" | "kanagawabones" | "randombones"
-- @tparam lightness string - "bright" | "dim"
-- @tparam darkness string - "stark" | "warm"
M.zenbones = function(variant, opts)
	local name = variant or "zenbones"

	opts = opts or {}

	if opts.lightness then
		vim.g.zenbones = {
			lightness = opts.lightness,
		}
	end

	if opts.darkness then
		vim.g.zenbones = {
			darkness = opts.darkness,
		}
	end

	vim.cmd("colorscheme " .. name)
end

-- @param variant string - "dark" | "dark_default" | "dimmed" | "light" | "light_default"
M.github = function(variant)
	require("github-theme").setup({
		theme_style = variant,
	})
end

-- @param variant string - "high" | "flat" | "low"
M.solarized = function(variant)
	if vim.o.background == "light" then
		vim.g.colorscheme = "solarized_light"
	else
		vim.g.colorscheme = "solarized_dark"

		if variant == "high" then
			vim.cmd("hi Normal guibg=#001e26")
		end
	end

	local name = "solarized"

	if variant then
		name = name .. "-" .. variant
	end

	vim.cmd("colorscheme " .. name)
end

-- @param variant string - "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
M.material = function(variant)
	vim.g.colorscheme = "material"
	vim.g.material_style = variant or "palenight"

	require("material").setup()

	vim.cmd("colorscheme material")
end

-- @param variant string - "nightfox" | "nordfox" | "dayfox" | "dawnfox" | "duskfox"
M.nightfox = function(variant)
	local colorscheme = variant or "nightfox"

	vim.g.colorscheme = "nightfox"

	vim.cmd("colorscheme " .. colorscheme)
end

-- @param variant string - "soft" | "medium" | "hard"
-- @param palette string - "material" | "mix" | "original"
M.gruvbox = function(variant, palette)
	vim.g.gruvbox_material_background = variant or "medium"
	vim.g.gruvbox_material_palette = palette or "material"
	vim.cmd("colorscheme gruvbox-material")
end

M.onedark = function()
	vim.cmd("colorscheme onedark")
end

return M
