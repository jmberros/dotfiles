return {
  --
  -- Mini
  -- https://github.com/echasnovski/mini.nvim?tab=readme-ov-file#modules
  --
  { 'echasnovski/mini.bufremove', version = '*' },
  -- UI --
  --
  -- Themes
  -- https://dotfyle.com/neovim/colorscheme/top
  { "ellisonleao/gruvbox.nvim", config = true},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim", name = "kanagawa" },
  { "EdenEast/nightfox.nvim" },
  { "neanias/everforest-nvim" },
  -- { "sainnhe/everforest", name = "everforest" },
  { "tiagovla/tokyodark.nvim", name = "tokyodark" },
  { "rose-pine/neovim", name = "neovim" },
  -- { "navarasu/onedark.nvim", name = "onedark" },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro" },
  { "sainnhe/gruvbox-material", name = "gruvbox-material" },
  { "scottmckendry/cyberdream.nvim", name = "cyberdream" },
  { "Mofiqul/dracula.nvim", name = "dracula" },
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
  -- Make frequent and recent ("frecent") files more prominent in telescope picking:
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  -- Theme picker, preview, persistence:
  -- I'm not really using it yet:
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      -- Function to dynamically collect all available colorschemes
      local function get_available_colorschemes()
        -- Get the list of all available colorschemes
        local colorschemes = vim.fn.getcompletion('', 'color')

        return colorschemes
      end
      require("themery").setup({
        -- add the config here
        themes = get_available_colorschemes()
      })
    end,
  },
  --
  -- Coding --
  -- Sesssions
  -- I could also try this mini one:
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-sessions.md
  {
    "venv-selector.nvim",
    enabled = true,
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      suppressed_dirs = { '~/', '~/repos', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        injections = { enable = true },
    }
  },
  -- Trim whitespace on save:
  { "cappyzawa/trim.nvim", opts = {} },
  -- { 'echasnovski/mini.trailspace', version = '*' },
  -- Pytest: -- Can't make it work!
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-neotest/neotest-python",
  --   },
  --   opts = {
  --     adapters = {
  --       require("neotest-python")({
  --         runner = "pytest",
  --         python = ".venv/bin/python",
  --         pytest_discover_instances = true, -- "Experimental"
  --       })
  --     }
  --   }
  -- },
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
  { "folke/flash.nvim", enabled = false },  -- Annoying highlight when jumping to character

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  --
  --
  -- How to use ruff-lsp along with pyright:
  -- https://github.com/astral-sh/ruff-lsp/issues/384#issuecomment-1941556771
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "ruff",
        "pyright",
      }
    }
  },
  -- LSP config:
  {
    "neovim/nvim-lspconfig",
    opts = {
      pyright = {
        settings = {
        }
      },
      servers = {
        pyright = {
          settings = {
            -- Available settings:
            -- https://github.com/Microsoft/pyright/blob/main/docs/settings.md
            -- see :help :lspconfig-setup to figure out how these should be nested
            pyright = {
            },
            python = {
              analysis = {
                -- ignore = { "*" },  -- Use Ruff
                ignore = {},
                include = {
                  "takeup_core",
                  "command_center",
                  "rate_setting_guide",
                },
                -- typeCheckingMode = "off",
                diagnosticSeverityOverrides = {
                  -- see https://github.com/microsoft/pyright/blob/main/docs/configuration.md
                  reportArgumentType = "none",
                  reportCallIssue = "none",
                  reportReturnType = "warning",
                  reportAttributeAccessIssue = "none",
                  reportOptionalSubscript = "none",
                  reportOptionalMemberAccess = "none",
                  reportOptionalOperand = "none",
                  reportUnusedVariable = "none",
                }
              }
            }
          }
        }
      }
    },
  },
  {  -- For some reason, enabling this messes up Pyright??!
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "100" },
        }
      }
    }
  },
    --   "jose-elias-alvarez/null-ls.nvim",
  -- {
    --   ft = { "python" },
    --   opts = function ()
    --     local null_ls  = require("null-ls")
    --     return {
    --       sources = {
    --         -- null_ls.builtins.diagnostics.mypy,
    --         null_ls.builtins.diagnostics.ruff,
    --         null_ls.builtins.formatting.ruff,
    --         -- null_ls.builtins.diagnostics.mypy,
    --       }
    --     }
    --   end
    -- },
  --   opts = {
  --     servers = {
  --       -- Ensure mason installs the server
  --       marksman = {},
  --       pyright = {
  --         enabled = true,
  --         filetypes = { "python" },
  --         settings = {
  --           pyright = {
  --             autoImportCompletion = true,
  --             disableOrganizeImports = true, -- Use Ruff
  --           },
  --           python = {
  --             include = {
  --               -- Is this necessary??
  --               "command_center",
  --               "takeup_core",
  --               "rate_setting_guide",
  --               "src",
  --             },
  --             analysis = {
  --               -- ignore = {  }, -- Use Ruff
  --               autoSearchPaths = true,
  --               -- diagnosticMode = "openFilesOnly",
  --               useLibraryCodeForTypes = true,
  --               typeCheckingMode = "off", -- Could use mypy
  --             },
  --           },
  --         },
  --       },
  --       ruff = { enabled = true },
  --       ruff_lsp = {},
  --     },
  --     setup = {
  --       ruff = function()
  --         -- require("lazyvim.util").on_attach(function(client, _)
  --         LazyVim.lsp.on_attach(function(client, _)
  --           if client.name == "ruff" then
  --             client.server_capabilities.hoverProvider = true
  --           end
  --         end)
  --       end,
  --     },
  --   },
}
