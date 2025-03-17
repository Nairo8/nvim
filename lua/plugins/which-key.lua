local icons = require("config.icons").which_key

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
  },
  opts = {
    preset = "modern",
    spec = {
      { "]", group = "next" },
      { "[", group = "prev" },
      { "g", group = "goto" },
      { "z", group = "fold" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "Latex", icon = icons.latex},
      { "<leader>q", group = "Quit" },
      { "<leader>w", group = "Windows" },
      { "<leader>t", group = "Toggle" },

      -- adding icons to existing mappings
      { "<leader>e", icon = { icon = icons.explorer, color = "green" }},
      { "<leader>E", icon = { icon = icons.explorer, color = "green" }},
      { "<leader>s", icon = { icon = icons.flash, color = "yellow" }},
      { "<leader>u", icon = icons.undo },
      { "<leader>wh", icon = { icon = icons.splitH, color = "blue" }},
      { "<leader>wv", icon = { icon = icons.splitV, color = "blue" }},
      { "<leader>ws", icon = { icon = icons.swap, color = "blue" }},
      { "<leader>fb", icon = { icon = icons.fuzzy, color = "green" }},
      { "<leader>fc", icon = { icon = icons.command, color = "blue" }},
      { "<leader>fC", icon = { icon = icons.command, color = "blue" }},
      { "<leader>fe", icon = { icon = icons.tree, color = "green" }},
      { "<leader>fE", icon = { icon = icons.tree, color = "green" }},
      { "<leader>ff", icon = { icon = icons.file, color = "green" }},
      { "<leader>fh", icon = { icon = icons.help, color = "yellow" }},
      { "<leader>fm", icon = { icon = icons.mark, color = "red" }},
      { "<leader>ft", icon = { icon = icons.note, color = "red" }},
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    for bufnr = 1, 9 do
      require("which-key").add({{"<leader>" .. bufnr, "<cmd>LualineBuffersJump " .. bufnr .. "<CR>", hidden = true}})
    end
  end,
}
