return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    keys = {{ "<leader>ti", "<cmd>IBLToggle<cr>", desc = "Toggle indents" }},
    opts = {
      indent = { char = "▏"},
      scope = {
        enabled = true,
        show_start = true,
      },
      exclude = {
        filetypes = {
          "alpha", "help",
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {"<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todo"},
      {"]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment"},
      {"[t", function() require("todo-comments").jump_prev() end, desc = "next todo comment"}
    },
    config = true,
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    ft = "markdown",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    keys = {{ "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown" }},
    config = true,
  },
}
