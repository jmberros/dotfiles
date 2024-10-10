-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set(
--   "n", -- normal mode
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )

-- Folding
vim.keymap.set("n", "<leader>f0", "zR", { noremap = true, silent = true, desc = "Unfold everything" })
vim.keymap.set("n", "<leader>f1", "zRzM", { noremap = true, silent = true, desc = "Fold to level 1" })
vim.keymap.set("n", "<leader>f2", "zRzMzr", { noremap = true, silent = true, desc = "Fold to level 2" })
vim.keymap.set("n", "<leader>f3", "zRzMzrzr", { noremap = true, silent = true, desc = "Fold to level 3" })

-- Rename symbol
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename Symbol" })
-- Insert Python debugger
vim.keymap.set("n", "<C-I>", "<esc>oimport ipdb; ipdb.set_trace()<esc>:wq<CR>", { noremap = true, silent = true })
-- Search git files
vim.keymap.set("n", "<C-P>", require("telescope.builtin").git_files, { noremap = true, silent = true })
-- Tab to switch buffer
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { noremap = true, silent = true })
-- Close buffer without closing window
-- ....
