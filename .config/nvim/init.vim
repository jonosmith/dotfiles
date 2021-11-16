""" Mappings --------------------------

" Escape also clears any current search highlighting (set the register
" holding the last search pattern to an empty string)
nnoremap <silent> <esc> :let @/=""<CR>


""" Environment specific setup --------

if exists('g:vscode')
  runtime ./init.vscode.vim
else
  runtime ./init.term.vim
endif
