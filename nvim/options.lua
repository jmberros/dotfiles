-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Blinking cursor, details provided by ChatGPT
vim.opt.guicursor =
  "n-v-c-sm:block-blinkwait500-blinkon250-blinkoff250,i-ci-ve:ver25-blinkwait500-blinkon250-blinkoff250,r-cr-o:hor20"

-- Shows the name of the current file on top, useful when you have splits
vim.opt.winbar = "%=%m %f"

-- vim.opt.foldmethod = "indent" -- expr by default

vim.opt.wrap = true
vim.opt.linebreak = true -- break lines at rate boundaries


vim.opt.colorcolumn = "100"
vim.g.autoformat = false
vim.opt.cursorline = false  -- DONT Highlight current line

-- Using ripgrep
-- https://www.reddit.com/r/neovim/comments/1c0bemk/using_ripgrep_as_grepprg_to_search_in_the_current/
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
