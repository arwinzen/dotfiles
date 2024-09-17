-- space is leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- easier access to escape key
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})

-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})

-- toggle transparency
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})

-- split vertical
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
-- Quicker close split
vim.keymap.set("n", "<leader>qq", ":q<CR>",
  {silent = true, noremap = true}
)

-- access netrw quickly
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keymap to toggle wrap on and off
vim.api.nvim_set_keymap('n', '<leader>w', ':set wrap!<CR>:set linebreak!<CR>', { noremap = true, silent = true })

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- Fix typo when trying to quit vim
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- Quickly clear search highlighting
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")

-- Disable space key in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Open the current file in the default program (on Mac this should just be just `open`)
vim.keymap.set('n', '<leader>x', ':!open %<cr><cr>')

-- Move text up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Disable the default behavior of Ctrl + y and Ctrl + e for scrolling in normal mode
vim.api.nvim_set_keymap('n', '<C-y>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-e>', '<Nop>', { noremap = true })

