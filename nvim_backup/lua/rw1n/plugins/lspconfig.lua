local lspconfig = require('lspconfig')

-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- nvim reports a set of capabilities to the language server to tell the ls what nvim understands
-- this line adds some extra capabilities from the completion engine
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- PHP
lspconfig.intelephense.setup({ capabilities = capabilities })

-- Bash
lspconfig.bashls.setup({ capabilities = capabilities })

-- SQL
lspconfig.sqlls.setup({ capabilities = capabilities })

-- Tailwind CSS
lspconfig.tailwindcss.setup({ capabilities = capabilities })

-- Go
lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
})

-- JSON
lspconfig.jsonls.setup({
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      },
    },
})

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
