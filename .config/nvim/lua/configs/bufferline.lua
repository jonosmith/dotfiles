local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

vim.o.termguicolors = true

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

bufferline.setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {{ filetype = "NvimTree", text = "File Explorer" , text_align = "left" }},
  }
}

