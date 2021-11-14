
if exists('g:vscode')
  " VSCode Specific -------------------

  nnoremap ge <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
  nnoremap gE <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
  nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
  nnoremap <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>
else
  " Terminal specific -----------------
  set number
  
  :set shiftwidth=2
  :set autoindent
  :set smartindent
endif


""" Mappings --------------------------

" Escape also clears any current search highlighting (set the register
" holding the last search pattern to an empty string)
nnoremap <silent> <esc> :let @/=""<CR>


""" Plugins ---------------------------

if has('nvim')
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin(stdpath('data') . '/plugged')

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'

call plug#end()
