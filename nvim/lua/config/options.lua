-- use spaces instead of tabs
vim.opt.expandtab = true

-- how many spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- makes sure the next line for nested code blocks are indented
vim.opt.smartindent = true

-- no line wrap
vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

-- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.wildmode = 'longest:full,full'

-- shows current file and working directory
vim.opt.title = true
-- enable mouse for all modes
vim.opt.mouse = 'a'

vim.opt.termguicolors = true
-- vim.opt.spell = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true --enable the below list of chars
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer

vim.opt.splitbelow = true
vim.opt.splitright = true

-- keeps cursor 8 lines off top and bottom of the screen when scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- vim.opt.clipboard = 'unnamedplus' -- use system clipboard

vim.opt.confirm = true -- ask for confirmation instead of erroring

vim.opt.signcolumn = 'yes:2'

-- persistent undos
-- prevent vim from doing backups
-- let undotree have access to long running undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- automatically save a backup
-- vim.opt.backup = true
-- keep backups out of current directory
-- vim.opt.backupdir:remove('.')

-- Disable the default behavior of Ctrl + y and Ctrl + e for scrolling in normal mode
vim.api.nvim_set_keymap('n', '<C-y>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-e>', '<Nop>', { noremap = true })
