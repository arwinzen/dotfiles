return {
  {
    'folke/twilight.nvim',
    ft = "markdown",
    opts = {
      -- custom config goes here
    }
  },
  {
    'preservim/vim-pencil',
  },
  {
    'folke/zen-mode.nvim',
    opts = {
        window = {
        backdrop = 0.95,
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        options = {
          enabled = true,
          ruler = true, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus' 
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = true }, -- disables the tmux statusline
        wezterm = {
          enabled = true,
          font = "+20", -- (10% increase per step)
        },
      },
      on_open = function()
        vim.opt.wrap = true      -- Enable wrap when Zen Mode opens
        vim.opt.linebreak = true -- Prevent breaking lines mid-word
      end,
      on_close = function()
        vim.opt.wrap = false     -- Disable wrap when Zen Mode closes
        vim.opt.linebreak = false
      end,
    }
  },
}