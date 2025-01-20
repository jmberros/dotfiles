-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set(
--   "n", -- normal mode
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )

local function noremap_silent(desc)
  return { noremap = true, silent = true, desc=  desc }
end

-- Folding --
vim.keymap.set("n", "<leader>f0", "zRzT", noremap_silent("Unfold everything"))
vim.keymap.set("n", "<leader>f1", "zRzMzOzT", noremap_silent("Fold to level 1"))
vim.keymap.set("n", "<leader>f2", "zRzMzrzOzT", noremap_silent("Fold to level 2"))
vim.keymap.set("n", "<leader>f3", "zRzMzrzrzOzT", noremap_silent("Fold to level 3"))

-- Rename symbol
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename Symbol" })
-- Insert Python debugger
vim.keymap.set("n", "<leader>id", "<esc>oimport ipdb; ipdb.set_trace()<esc>:w<CR>", noremap_silent("Insert Python debugger"))
vim.keymap.set("n", "<leader>it", "<esc>A  # type: ignore<esc>:w<CR>", noremap_silent("Append '# type: ignore'"))
-- FZF search:
-- vim.keymap.set("n", "<C-P>", require("telescope.builtin").git_files, noremap_silent("Search git files"))
vim.keymap.set("n", "<C-P>", require("fzf-lua").git_files, noremap_silent("Fzf git files"))
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, noremap_silent("Fzf files"))
vim.keymap.set("n", "<leader>uC", require("fzf-lua").colorschemes, noremap_silent("Fzf colorschemes"))
vim.keymap.set("n", "<leader>ua", require("fzf-lua").awesome_colorschemes, noremap_silent("Fzf awesome colorschemes"))
vim.keymap.set("n", "<leader>/", require("fzf-lua").grep_project, noremap_silent("Fzf ripgrep project"))
vim.keymap.set("n", "<leader>ss", require("fzf-lua").lsp_document_symbols, noremap_silent("Fzf document symbols"))
vim.keymap.set("n", "<leader>sS", require("fzf-lua").lsp_live_workspace_symbols, noremap_silent("Fzf live query project symbols"))
-- vim.keymap.set('n', '<leader>ff', require("fzf-lua").files, { desc = 'FzF find files' })
-- vim.keymap.set('n', '<leader>fg', require("fzf-lua").live_grep, { desc = 'FzF live grep' })
-- vim.keymap.set('n', '<leader>fb', require("fzf-lua").buffers, { desc = 'FzF buffers' })
-- vim.keymap.set('n', '<leader>fh', require("fzf-lua").help_tags, { desc = 'FzF help tags' })
-- Tab to switch buffer
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", noremap_silent("Next buffer"))
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", noremap_silent("Previous buffer"))
-- Close buffers and keep neo-tree opened
vim.keymap.set("n", "<leader>ba", "<cmd>%bd<cr><cmd>Neotree<cr>", noremap_silent("Delete all buffers, keep Neotree"))
-- Close buffer without closing window
-- ....
-- -- Run Pytest
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>t",
--   ":lua RunPytestInTerminal()<CR>",
--   noremap_silent("Run pytest for the test under the cursor")
-- )
-- function GetTestFunctionName()
--   local line = vim.fn.getline('.')
--   local test_name = line:match('def%s+(test_[%w_]+)%s*%(')
--
--   -- If we found a test function name, return it
--   if test_name then
--     return test_name
--   else
--     return nil
--   end
-- end
-- function GetCurrentFunctionName()
--   -- Get the current buffer and cursor position
--   local ts_utils = require('nvim-treesitter.ts_utils')
--   local node = ts_utils.get_node_at_cursor()
--   -- Traverse the tree upwards to find the function definition
--   while node do
--     if node:type() == 'function_definition' then
--       -- Extract the function name
--       local name_node = node:child(1)  -- For Python, function name is usually the second child of the function_definition
--       if name_node then
--         local function_name = ts_utils.get_node_text(name_node, 0)[1]
--         return function_name
--       end
--     end
--     -- Traverse upwards
--     node = node:parent()
--   end
--   return nil
-- end
-- -- Function to run the pytest test under the cursor in a new terminal
-- function RunPytestInTerminal()
--   -- Get the current file and cursor position
--   local file = vim.fn.expand('%')
--   -- local test_name = GetTestFunctionName()
--   local test_name = GetCurrentFunctionName()
--   -- Construct the pytest command with the file and line number
--   local pytest_cmd = "pytest -vvv --pdb --disable-warnings " .. file .. "::" .. test_name
--
--   -- Open a new terminal and run the pytest command
--   vim.cmd("split term://bash")
--   vim.cmd("resize 50")  -- Optional: Resize the terminal window
--   vim.fn.chansend(vim.b.terminal_job_id, pytest_cmd .. "\n")
-- end
