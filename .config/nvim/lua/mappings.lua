local utils = require "utils"

local map = utils.map

-- Completion
vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]]
vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
vim.cmd[[inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]

-- Diagnostics
map('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

-- LSP
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map("n", "<leader>ca", "<cmd>CodeActionMenu<CR>")
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- Telescope
map('n', '<leader>fb', "<cmd>Telescope buffers <CR>")
map('n', '<leader>ff', "<cmd>Telescope find_files <CR>")
map('n', '<leader>fa', "<cmd>Telescope find_files hidden=true <CR>")
map('n', '<leader>fd', "<cmd>Telescope dotfiles <CR>")
map('n', '<leader>fg', "<cmd>Telescope live_grep <CR>")
map('n', '<leader>fh', "<cmd>Telescope help_tags <CR>")
map('n', '<leader>f/', "<cmd>Telescope search_history <CR>")
map('n', '<leader>fq', "<cmd>Telescope quickfix <CR>")
map('n', '<leader>frs', "<cmd>Telescope relative_grep <CR>")
map('n', '<leader>gb', "<cmd>Telescope git_branches <CR>")
map('n', '<leader>gc', "<cmd>Telescope git_commits <CR>")
map('n', '<leader>gbc', "<cmd>Telescope git_buffer_commits <CR>")
map('n', '<leader>gs', "<cmd>Telescope git_status <CR>")

-- Navigation
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('n', '<leader>+', ':vertical resize +5<CR>')
map('n', '<leader>-', ':vertical resize -5<CR>')

-- Comments
map("n", "<leader>/", "<cmd>CommentToggle <CR>")
map("v", "<leader>/", "<cmd>CommentToggle <CR>")

-- Other

-- Esc also clears any highlighted text
map("n", "<Esc>", "<cmd>let @/=''<CR>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Close buffer (tab)
map("n", "<leader>x", "<cmd>bd<CR>")

-- Reload vimrc file
map("n", "<leader>sv", "<cmd>:source $MYVIMRC<CR>")
