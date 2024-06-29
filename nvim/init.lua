local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Swap file stuff, cuz it was bugging for me :/ 
vim.o.directory = vim.fn.expand('$HOME/.local/state/nvim/swap//')
vim.api.nvim_create_augroup('AutoDeleteSwap', {clear = true})
vim.api.nvim_create_autocmd('SwapExists', {
  group = 'AutoDeleteSwap',
  pattern = '*',
  command = "let v:swapchoice = 'd'"
})
-- By Kaare
