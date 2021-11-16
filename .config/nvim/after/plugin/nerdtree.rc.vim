nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n>n :NERDTree<CR>
nnoremap <C-n>t :NERDTreeToggle<CR>
nnoremap <C-n>f :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

