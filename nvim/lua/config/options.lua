-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Make lines numbers non-relative
vim.opt.number = true -- Enable absolute line numbers
vim.opt.relativenumber = false -- Disable relative line numbers

-- 80 character line limit
vim.opt.textwidth = 80 -- Automatically wraps text at 80 characters
vim.opt.formatoptions:append("t") -- Enables auto line-wrappin
vim.opt.wrap = true -- Soft wrap for better visual display
vim.opt.linebreak = true -- Wrap at word boundaries
