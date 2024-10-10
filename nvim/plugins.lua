-- -- Keymap for organizing imports with Ruff LSP
-- local on_attach = function(client, bufnr)
--   -- Only set up keymap if the server supports code actions
--   if client.server_capabilities.codeActionProvider then
--     vim.api.nvim_buf_set_keymap(
--       bufnr,
--       'n',
--       '<leader>oi',
--       '<cmd>lua vim.lsp.buf.code_action({ only = { "source.organizeImports" } })<CR>',
--       { noremap = true, silent = true }
--     )
--   end
-- end
--
-- -- LSP setup for Ruff (if using nvim-lspconfig)
-- require'lspconfig'.ruff_lsp.setup{
--   on_attach = on_attach,
-- }


return {
  --
  -- UI --
  --
  -- https://www.lazyvim.org/plugins/ui
  {
    "nvim-notify",
    opts = {
      timeout = 3 * 1000,
    },
  },
  {
    "neo-tree.nvim",
    opts = {
      window = { position = "right", width = 60 },
      filesystem = {
        filtered_items = {
          visible = false,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.git',
            '.pytest_cache',
            '.vscode',
            '.ipynb_checkpoints',
            '__pycache__',
            '*.egg-info'
          }
        }
      }
    }
  },
  {
    "telescope.nvim",
    opts = {
      -- NOTE: I couldn't make this remapping work:
      -- keys = {
        -- {
        --   "<leader>sS",
        --   function()
        --     require("telescope.builtin").lsp_document_symbols({
        --       symbols = LazyVim.config.get_kind_filter(),
        --     })
        --   end,
        --   desc = "Goto Symbol",
        -- },
        -- {
        --   "<leader>ss",
        --   function()
        --     require("telescope.builtin").lsp_dynamic_workspace_symbols({
        --       symbols = LazyVim.config.get_kind_filter(),
        --     })
        --   end,
        --   desc = "Goto Symbol (Workspace)",
        -- },
      -- },
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          },
          n = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          }
        }
      }
    }
  },
  --
  -- Coding --
  -- Sesssions
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      suppressed_dirs = { '~/', '~/repos', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },
  -- Trim whitespace on save:
  { "cappyzawa/trim.nvim", opts = {} },
  -- Pytest:
  -- {}
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    -- config = function()
    --   require("neotest").setup({
    --     adapters = {
    --       require("nvim-neotest/neotest-python")({
    --         runner = "pytest",
    --         python = ".venv/bin/python",
    --       })
    --     }
    --   })
    -- end
  },
  --
  -- Git blame
  {
      "f-person/git-blame.nvim",
      -- load the plugin at startup
      event = "VeryLazy",
      -- Because of the keys part, you will be lazy loading this plugin.
      -- The plugin wil only load once one of the keys is used.
      -- If you want to load the plugin at startup, add something like event = "VeryLazy",
      -- or lazy = false. One of both options will work.
      opts = {
          enabled = true,  -- if you want to enable the plugin
          message_template = " <author> • <summary> • <date> • <<sha>>",
          -- template for the blame message, check the Message template section for more options
          date_format = "%b %d, %Y", -- template for the date, check Date format section for more options
          virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
      },
  },
  --
  -- https://www.reddit.com/r/neovim/comments/15vcurk/how_to_config_pyright_using_lazyvim/
  --
  -- How to use ruff-lsp along with pyright:
  -- https://github.com/astral-sh/ruff-lsp/issues/384#issuecomment-1941556771
  --
  -- LSP config:
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        marksman = {},
        pyright = {
          enabled = false,
          settings = {
            pyright = {
              autoImportCompletion = true,
              disableOrganizeImports = true, -- Use Ruff
            },
            python = {
              include = {
                -- Is this necessary??
                "command_center",
                "takeup_core",
                "rate_setting_guide",
              },
              analysis = {
                ignore = { "*" }, -- Use Ruff
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off", -- Could use mypy
              },
            },
          },
        },
        ruff = { enabled = true },
        ruff_lsp = {},
      },
      setup = {
        ruff = function()
          -- require("lazyvim.util").on_attach(function(client, _)
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "ruff" then
              client.server_capabilities.hoverProvider = true
            end
          end)
        end,
      },
    },
  },
}
