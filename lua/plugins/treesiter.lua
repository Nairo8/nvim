return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = {"BufReadPost", "BufNewFile", "VeryLazy"},

    opts_extend = {"ensure_installed"},
    opts = {
      ensure_installed = {"java", "javascript", "json", "markdown", "python", "vim", "vimdoc"},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-Space>", -- set to `false` to disable one of the mappings
          node_incremental =  "<C-Space>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        enable = true,
        move = {
          enable = true,
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    keys = {
      {"<leader>fk", function()
        require("treesitter-context").go_to_context()
      end, desc = "Find context"},
      {"<leader>tk", "<cmd>TSContextToggle<cr>", desc = "Toggle context",}
    },
    opts = {
      max_lines = 1,
      line_numbers = true,
    },
  },
}
