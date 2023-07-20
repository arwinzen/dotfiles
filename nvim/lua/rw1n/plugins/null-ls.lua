local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- es lint
    code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),

    -- prettier
    formatting.prettierd,

    -- refactoring library based off the Refactoring book by Martin Fowler
    -- :'<,'>lua vim.lsp.buf.range_code_action() (for the default handler)
    -- or :'<,'>Telescope lsp_range_code_actions (for Telescope).
    code_actions.refactoring,

    -- Go
    formatting.gofmt, -- command : gofmt
    formatting.gofumpt, -- command : gofumpt
    formatting.goimports, -- command : goimports
    formatting.golines, -- command : golines

    -- proselint
    -- require('null-ls').builtins.code_actions.proselint,
    -- require('null-ls').builtins.diagnostics.proselint,

    -- Lua (need to install luacheck binary first)
    -- diagnostics.luacheck.with({
    --   extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc' },
    -- }),
    -- formatting.stylua,

    diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),

    -- php
    formatting.phpcsfixer,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- Commands
vim.api.nvim_create_user_command('Format', vim.lsp.buf.format, {})
