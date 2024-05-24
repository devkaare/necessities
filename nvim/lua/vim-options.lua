-- Key mappings
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>', ':set wrap!<CR>', { noremap = true, silent = true })

-- Display settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

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
