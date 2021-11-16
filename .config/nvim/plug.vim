if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin(stdpath('data') . '/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'preservim/nerdtree'
  Plug 'folke/trouble.nvim'
  Plug 'ahmedkhalf/project.nvim'
  Plug 'dyng/ctrlsf.vim'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
call plug#end()
