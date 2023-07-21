require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    highlight = {
      enable = true,
      disable = { 'NvimTree' },
      -- uses nvim builtin syntax highlighting to help with spelling errors on variables
      -- additional_vim_regex_highlighting = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["ic"] = "@class.inner",
          ["ac"] = "@class.outer",
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
    context_commentstring = {
      enable = true,
    },
    -- Needed because treesitter highlight turns off autoindent for php files
    indent = {
      enable = true,
    }
})
