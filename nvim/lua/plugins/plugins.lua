return {
    'tpope/vim-sleuth',
    'onsails/lspkind.nvim', -- vs code symbols for lsp
    'xiyaowong/transparent.nvim',
    { 'karb94/neoscroll.nvim', config = true },

    -- Git related plugins
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    {
        "NeogitOrg/neogit",
        lazy = false,
        dependencies = {
          "nvim-lua/plenary.nvim",         -- required
          "sindrets/diffview.nvim",        -- optional - Diff integration
          "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    }
}
