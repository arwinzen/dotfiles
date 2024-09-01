-- Fuzzy finder

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',  -- Provides file icons in the Telescope UI.
    'nvim-telescope/telescope-live-grep-args.nvim',  -- Adds the ability to pass arguments to the live grep functionality.
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    -- Key mappings to trigger various Telescope built-in functions and extensions.
    { '<leader>f', function() require('telescope.builtin').find_files() end },
    { '<leader>F', function() require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' }) end },
    { '<leader>b', function() require('telescope.builtin').buffers() end },
    { '<leader>g', function() require('telescope').extensions.live_grep_args.live_grep_args() end },
    { '<leader>h', function() require('telescope.builtin').help_tags() end },
    { '<leader>s', function() require('telescope.builtin').lsp_document_symbols() end },
  },
  config = function ()
    local actions = require('telescope.actions')  -- Loads Telescope's built-in actions for customizing behavior.

    require('telescope').setup({
      defaults = {
        path_display = { truncate = 1 },  -- Truncates the displayed file paths to 1 part of the path.
        prompt_prefix = '   ',
        selection_caret = '  ',  -- Sets a custom caret (empty space here) for the selected item in the list.
        layout_config = {
          prompt_position = 'top',
          preview_width = 0.65,
          horizontal = {
            size = {
              width = "95%",
              height = "95%",
            }
          }
        },
        preview = {
          timeout = 200,  -- Sets a timeout (in milliseconds) for the preview window to reduce lag on large files.
        },
        sorting_strategy = 'ascending',
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<C-Down>'] = actions.cycle_history_next,  -- Cycles to the next item in the command history.
            ['<C-Up>'] = actions.cycle_history_prev,  -- Cycles to the previous item in the command history.
          },
        },
        file_ignore_patterns = { '.git/' },  -- Ignores files and directories matching this pattern (e.g., `.git/`).
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              -- Binds <C-k> to quote the current prompt for exact matching.
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              -- Binds <C-i> to quote and add an `--iglob` flag for case-insensitive glob matching.
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,  -- Enables the display of hidden files in the `find_files` picker.
        },
        buffers = {
          previewer = false,  -- Disables the file previewer in the buffers picker to make it more compact.
          layout_config = {
            width = 80,  -- Sets the width of the buffers picker to 80 columns.
          },
        },
        oldfiles = {
          prompt_title = 'History',  -- Customizes the title of the `oldfiles` picker to "History".
        },
        lsp_references = {
          previewer = false,  -- Disables the previewer for LSP references to reduce clutter.
        },
        lsp_definitions = {
          previewer = false,  -- Disables the previewer for LSP definitions, similar to references.
        },
        lsp_document_symbols = {
          symbol_width = 55,  -- Sets a fixed width for symbols in the `lsp_document_symbols` picker.
        },
      },
    })

    require('telescope').load_extension('fzf')  -- Loads the FZF extension, which enhances sorting performance.
  end,
}

