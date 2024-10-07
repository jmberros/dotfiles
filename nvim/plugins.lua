return {
  --
  -- UI --
  --
  -- https://www.lazyvim.org/plugins/ui
  {
    "nvim-notify",
    opts = {
      timeout = 10 * 1000,
    },
  },
  --
  -- Coding --
  --
  -- Trim whitespace on save:
  { "cappyzawa/trim.nvim", opts = {} },

}
