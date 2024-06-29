-- Key mappings
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {})

-- Display settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.wrap = false

-- Indentation settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Leader key
vim.g.mapleader = " "

-- Update time for autosave
vim.opt.updatetime = 50

-- Clipboard settings
vim.cmd("set clipboard+=unnamedplus")

