local utils = require("utils")

return {
  {"sainnhe/gruvbox-material"},
  {"rebelot/kanagawa.nvim"},
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            conditionals = "italic",
            constants = "bold",
            functions = "italic",
            keywords = "italic",
            numbers = "bold",
          },
        },
      })
      vim.cmd.colorscheme("nightfox")
      utils.toggle_transparency()
    end,
  },
  {"navarasu/onedark.nvim"},
}
