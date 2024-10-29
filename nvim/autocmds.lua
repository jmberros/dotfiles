-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Treat SQLFluff config file as TOML
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.sqlfluff",
  command = "setfiletype toml",
})

-- Set textwidth for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.textwidth = 99
  end,
})
