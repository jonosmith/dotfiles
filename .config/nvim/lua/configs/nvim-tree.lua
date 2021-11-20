local present, tree = pcall(require, "nvim-tree")
if not present then
   return
end


vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })

vim.g.nvim_tree_highlight_opened_files = 1

tree.setup {
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
}

