return {
  {
    'echasnovski/mini.comment',
    event = {"BufReadPre", "BufNewFile"},
    opts = {},
  },
  {
    'echasnovski/mini.files',
    event = {"BufReadPre", "BufNewFile"},
    keys = {
      { "<leader>fe", "<cmd>lua MiniFiles.open()<cr>", desc = "File Tree" },
      { "<leader>fE", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>", desc = "File Tree (Root)" },
    },
    opts = {},
  },
  {
    "echasnovski/mini.move",
    event = {"BufReadPre", "BufNewFile"},
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
      modes = { insert = true, command = true, terminal = false },
    },
  },
  {
    'echasnovski/mini.sessions',
    event = {"BufReadPre", "BufNewFile"},
    opts = {
      autowrite = true,
    },
  },
  {
    "echasnovski/mini.surround",
    event = {"BufReadPre", "BufNewFile"},
    opts = {},
  },
}
