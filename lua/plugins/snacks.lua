return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {"]r", function() Snacks.words.jump(1, true) end, desc = "Next reference"},
  },
  opts = {
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    input = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    statuscolumn = {
      folds = {
        open = false,
      }
    },
    words = {
      debounce = 0,
    },
  },
}
