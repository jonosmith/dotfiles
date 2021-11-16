runtime ./plug.vim
runtime ./maps.vim

" Show line numbers
" set number relativenumber
set number

:set shiftwidth=2
:set autoindent
:set smartindent

" true color
if exists("&termguicolors") && exists("&winblend")
  " syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  " set background=light

  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif
