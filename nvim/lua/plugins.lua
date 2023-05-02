local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Common utils
  use("nvim-lua/plenary.nvim")

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
  use({
    "williamboman/mason.nvim",
    config = require("configs.mason"),
  })
  use("williamboman/mason-lspconfig.nvim")
  use("simrat39/symbols-outline.nvim")
  use("folke/trouble.nvim")
  use({
    -- LSP UIs
    "glepnir/lspsaga.nvim",
    config = require("configs.lspsaga"),
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = require("configs.null-ls"),
  })

  -- Completion
  use({ "onsails/lspkind-nvim" })
  use({
    "hrsh7th/nvim-cmp",
    config = require("configs.nvim-cmp"),
  })
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use({
    "David-Kunz/cmp-npm",
  })
  use({ "hrsh7th/cmp-vsnip" })
  use({ "hrsh7th/vim-vsnip" })

  -- Scrollbars
  use({ "dstein64/nvim-scrollview" })

  -- Sidebar File Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    config = require("configs.nvim-tree"),
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
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
    config = require("configs.telescope"),
  })

  -- Git
  use({ "sindrets/diffview.nvim" })
  -- use({
  -- 	"lewis6991/gitsigns.nvim",
  -- 	config = require("configs.gitsigns"),
  -- })
  use({ "tpope/vim-fugitive" })
  use({
    "tanvirtin/vgit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = require("configs.vgit"),
  })
  use({ "junegunn/gv.vim" })

  -- Markdown
  use("godlygeek/tabular")
  use("plasticboy/vim-markdown")

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
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = require("configs.neotest"),
  })

  -- Themes
  use "EdenEast/nightfox.nvim"
  use("ishan9299/nvim-solarized-lua")


  -- Other
  use("kyazdani42/nvim-web-devicons")
end)
