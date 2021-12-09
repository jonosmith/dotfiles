local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")

packer.init({
	package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

return packer.startup(function(use)
	-- Core Vim enhancements
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("chaoren/vim-wordmotion")

	-- LSP stuff
	use({
		"neovim/nvim-lspconfig",
		config = require("configs.lspconfig"),
	})
	use("williamboman/nvim-lsp-installer")
	use("simrat39/symbols-outline.nvim")
	use("folke/trouble.nvim")
	use({
		"weilbith/nvim-code-action-menu",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = { "neovim/nvim-lspconfig" },
		config = require("configs.nvim-cmp"),
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "hrsh7th/vim-vsnip" })

	-- Sidebar File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = require("configs.nvim-tree"),
	})

	-- Tabs
	use({
		"akinsho/bufferline.nvim",
		config = require("configs.bufferline"),
	})
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Bottom status bar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = require("configs.lualine"),
	})

	-- Syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = require("configs.treesitter"),
	})

	-- Helper for commenting lines
	use({
		"terrortylor/nvim-comment",
		config = require("configs.comment"),
	})

	-- Documenting keymaps
	use({
		"folke/which-key.nvim",
		config = require("configs.whichkey"),
	})

	-- Automatically set vim settings from .editorconfig files
	use({
		"editorconfig/editorconfig-vim",
		config = require("configs.editorconfig"),
	})

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-media-files.nvim" },
		},
		config = require("configs.telescope"),
	})

	-- Git
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = require("configs.gitsigns"),
	})

	-- Markdown
	use("godlygeek/tabular")
	use("plasticboy/vim-markdown")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Highlight colors
	use({
		"norcalli/nvim-colorizer.lua",
		config = require("configs.colorizer"),
	})

	-- Delete buffers without losing window layout
	use("famiu/bufdelete.nvim")

	-- Undo history visualiser
	use("simnalamburt/vim-mundo")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = require("configs.toggleterm"),
	})

	-- Themes
	use("folke/tokyonight.nvim")
	use("NLKNguyen/papercolor-theme")
	use("overcache/NeoSolarized")
	use("mhartington/oceanic-next")
	use({
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
	})
	use("projekt0n/github-nvim-theme")
	use("ishan9299/nvim-solarized-lua")
	use("marko-cerovac/material.nvim")

	-- Other
	use("kyazdani42/nvim-web-devicons")
end)
