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
	use({
		"neovim/nvim-lspconfig",
		config = require("configs.lspconfig"),
	})

	use("folke/lsp-colors.nvim")

	use("williamboman/nvim-lsp-installer")

	use({
		"akinsho/bufferline.nvim",
		config = require("configs.bufferline"),
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = require("configs.treesitter"),
	})

	-- use("jparise/vim-graphql")

	use({
		"hrsh7th/nvim-cmp",
		config = require("configs.nvim-cmp"),
	})

	use({
		"terrortylor/nvim-comment",
		config = require("configs.comment"),
	})

	use("hrsh7th/cmp-nvim-lsp")

	use("hrsh7th/cmp-buffer")

	use("hrsh7th/cmp-path")

	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	use("nvim-lua/popup.nvim")

	use("kyazdani42/nvim-web-devicons")

	use({
		"kyazdani42/nvim-tree.lua",
		config = require("configs.nvim-tree"),
	})

	use("folke/trouble.nvim")

	use({
		"ahmedkhalf/project.nvim",
		config = require("configs.project"),
	})

	use("dyng/ctrlsf.vim")

	use("tpope/vim-fugitive")

	use("itchyny/lightline.vim")

	use({
		"editorconfig/editorconfig-vim",
		config = require("configs.editorconfig"),
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-media-files.nvim" },
		},
		config = require("configs.telescope"),
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

	use("tpope/vim-surround")
	use("tpope/vim-repeat")

	-- Themes
	use("NLKNguyen/papercolor-theme")
	use("overcache/NeoSolarized")
end)
