local present = pcall(require, "lspconfig")
if not present then
   return
end

local lsp_installer = require("nvim-lsp-installer")

-- Hover doc popup
--local pop_opts = { border = "rounded", max_width = 80, background = "red" }
--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
--vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)


local common_on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- formatting
    if client.name == 'tsserver' then
      client.resolved_capabilities.document_formatting = false
    end

    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[augroup END]]
    end

end


lsp_installer.on_server_ready(function(server)

  -- Set up completion using nvim_cmp with LSP source
--  local capabilities = require('cmp_nvim_lsp').update_capabilities(
--    vim.lsp.protocol.make_client_capabilities()
--  )

  local opts = {
    on_attach = common_on_attach,
    -- capabilities = capabilities,
    settings = {}
  }

  if server.name == "tsserver" then
    opts.on_attach = common_on_attach
    opts.settings.filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
  end

  if server.name == "sumneko_lua" then
    opts.settings.Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  end

  if server.name == "diagnosticls" then
    local on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = true
      common_on_attach(client, bufnr)
    end

    opts.on_attach = on_attach
    opts.filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' }
    opts.init_options = {
      linters = {
        eslint = {
          command = 'eslint_d',
          rootPatterns = { '.git' },
          debounce = 100,
          args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
          sourceName = 'eslint_d',
          parseJson = {
            errorsRoot = '[0].messages',
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[eslint] ${message} [${ruleId}]',
            security = 'severity'
          },
          securities = {
            [2] = 'error',
            [1] = 'warning'
          }
        },
      },
      filetypes = {
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
      },
      formatters = {
        eslint_d = {
          command = 'eslint_d',
          rootPatterns = { '.git' },
          args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        },
        prettier = {
          command = 'prettier_d_slim',
          rootPatterns = { '.git' },
          -- requiredFiles: { 'prettier.config.js' },
          args = { '--tab-width 2', '--stdin', '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
        css = 'prettier',
        javascript = 'prettier',
        javascriptreact = 'prettier',
        json = 'prettier',
        scss = 'prettier',
        less = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier',
        markdown = 'prettier',
      }
    }
  end

  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])

end)



-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

