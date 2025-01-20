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

-- From CHatGPT, makes nvim switch to the project directory when opening a Python file
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*.pyt",
--   callback = function()
--     local root = lspconfig.util.root_pattern(
--       ".git", "setup.py", "pyproject.toml"
--     )(vim.fn.expand("%:p"))
--     if root and root ~= vim.fn.getcwd() then
--       vim.cmd("cd " .. root)
--     end
--   end
-- })

-- Use internal formatting for bindings like gq.
-- NOR WORKING, https://vi.stackexchange.com/a/39800
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     vim.bo[args.buf].formatexpr = nil
--   end,
-- })
