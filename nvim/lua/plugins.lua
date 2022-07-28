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
	use("ggandor/lightspeed.nvim")

	-- LSP stuff
	use({
		"neovim/nvim-lspconfig",
		requires = { "jose-elias-alvarez/nvim-lsp-ts-utils", "hrsh7th/nvim-cmp" },
		config = require("configs.lspconfig"),
	})
	use("williamboman/nvim-lsp-installer")
	use("simrat39/symbols-outline.nvim")
	use("folke/trouble.nvim")
	use({
		"weilbith/nvim-code-action-menu",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require("configs.null-ls"),
	})

	-- Completion
	use({ "onsails/lspkind-nvim" })
	use({
		"hrsh7th/nvim-cmp",
		requires = { "neovim/nvim-lspconfig", "onsails/lspkind-nvim" },
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
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })

	-- Scrollbars
	use({ "dstein64/nvim-scrollview" })

	-- Sidebar File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = require("configs.nvim-tree").setup(),
	})

	-- Buffers
	use({
		"akinsho/bufferline.nvim",
		config = require("configs.bufferline"),
	})
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("famiu/bufdelete.nvim") -- Delete buffers without losing window layout

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
	use({
		"nvim-treesitter/playground",
		requires = { "nvim-treesitter/nvim-treesitter" },
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
	use({ "tpope/vim-fugitive" })
	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = require("configs.vgit"),
	})
	use({ "junegunn/gv.vim" })
	use({
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = require("configs.neogit"),
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

	-- Undo history visualiser
	use("simnalamburt/vim-mundo")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = require("configs.toggleterm"),
	})

	-- Tests
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
		},
		config = require("configs.neotest"),
	})

	-- Managing favourite files
	use({ "ThePrimeagen/harpoon" })

	-- Themes
	use("folke/tokyonight.nvim")
	use("NLKNguyen/papercolor-theme")
	use("mhartington/oceanic-next")
	use({
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
	})
	use("projekt0n/github-nvim-theme")
	use("marko-cerovac/material.nvim")
	use("dracula/vim")
	use("EdenEast/nightfox.nvim")
	use("sainnhe/gruvbox-material")
	use("navarasu/onedark.nvim")
	use("sainnhe/everforest")
	use("mswift42/vim-themes")
	use("ishan9299/nvim-solarized-lua")

	-- Other
	use("kyazdani42/nvim-web-devicons")
end)
