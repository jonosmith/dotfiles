M = {}

M.setTokyoNight = function()
	vim.cmd("colorscheme tokyonight")
end

M.setNeoSolarized = function()
	vim.g.neosolarized_termtrans = 1
	vim.cmd("colorscheme NeoSolarized")
end

M.setOceanicNext = function()
	vim.g.oceanic_next_terminal_bold = 0
	vim.cmd("colorscheme OceanicNext")
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
	vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
	vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
	vim.cmd("highlight NvimTreeFolderIcon guibg=blue")
end

M.setPaperColor = function()
	vim.cmd("colorscheme PaperColor")
end

-- @tparam lightness string - "bright" | "dim"
-- @tparam darkness string - "stark" | "warm"
M.setZenbones = function(opts)
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

	vim.cmd("colorscheme zenbones")
end

-- @param variant string - "dark" | "dark_default" | "dimmed" | "light" | "light_default"
M.setGithub = function(variant)
	require("github-theme").setup({
		theme_style = variant,
	})
end

-- @param variant string - "high" | "flat" | "low"
M.setSolarized = function(variant)
	local name = "solarized"

	if variant then
		name = name .. "-" .. variant
	end

	vim.cmd("colorscheme " .. name)
end

-- @param variant string - "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
M.setMaterial = function(variant)
	vim.g.material_style = variant or "palenight"

	require("material").setup()

	vim.cmd("colorscheme material")
end

return M
