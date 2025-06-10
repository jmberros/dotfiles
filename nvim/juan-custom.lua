--
-- Project-specific colorscheme
--
local function set_theme_for_project()
  local repo = os.getenv("REPO") or ""
  local colortable = {
    ["NVIM"] = "tokyodark",
    ["DBT"] = "kanagawa-wave",
    ["CC"] = "duskfox",
    ["RSG"] = "gruvbox",
    ["CORE"] = "tokyonight",
    ["INTEGRATIONS"] = "everforest",
    ["MODEL"] = "catppuccin-macchiato",
    -- ["SERVICES"] = "rose-pine-main",
    ["SERVICES"] = "kanagawa",
    -- ["SERVICES"] = "nightfox",
    ["WEBAPP"] = "carbonfox",
  }
  local chosen_theme = colortable[repo] or "tokyonight"
  vim.cmd("colorscheme " .. chosen_theme)
end
print("Hello")
-- Run this function when Neovim starts
set_theme_for_project()

--
-- Auto-open Neo-tree on startup if no file is specified
--
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if no file was opened (i.e., opening a directory)
    if vim.fn.argc() == 0 then
      -- Open Neo-tree
      vim.cmd("Neotree show")
    end
  end,
})

-- Tab = 4 sapces for SQL
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})

vim.wo.wrap = true
