
" VSCode Specific -------------------

nnoremap ge <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap gE <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>


""" Plugins ---------------------------

call plug#begin(stdpath('data') . '/plugged')

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'

call plug#end()
