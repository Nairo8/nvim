return {
  "folke/flash.nvim",
  event = "VeryLazy",
  --@type Flash.Config
  keys = {
    { "<leader>s", mode = { "n", "o", "x" },
      function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" },
      function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o",
      function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" },
      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },
      function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  opts = {
    modes = {
      char = {
        keys = { "f", "F", "t", "T", [";"] = "L", [","] = "H"},
        char_actions = function(motion)
          return {
            ["L"] = "next", -- set to `right` to always go right
            ["H"] = "prev", -- set to `left` to always go left
            -- clever-f style
            [motion:lower()] = "next",
            [motion:upper()] = "prev",
            -- jump2d style: same case goes next, opposite case goes prev
            -- [motion] = "next",
            -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
          }
        end,
      }
    }
  },
}
