local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   local common_on_attach = function(client, bufnr)
     -- Perform a format on save if the client supports it
     if client.resolved_capabilities.document_formatting then
       vim.api.nvim_command [[augroup Format]]
       vim.api.nvim_command [[autocmd! * <buffer>]]
       vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
       vim.api.nvim_command [[augroup END]]
     end

     attach(client, bufnr)
   end

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = common_on_attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      -- local function buf_set_keymap(...)
      --    vim.api.nvim_buf_set_keymap(bufnr, ...)
      -- end

      if server.name == "tsserver" then
        local on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false

          common_on_attach(client, bufnr)
        end

        opts.on_attach = on_attach
        opts.filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
      end


      if server.name == "sumneko_lua" then
        opts.settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
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
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
