local icons = require("config.icons")

return {
  'nvim-lualine/lualine.nvim',
  -- lazy = false,
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      globalstatus = true,
      always_divide_middle = false,
      section_separators = '',
      component_separators = '',
      disabled_filetypes = {"alpha"},
    },
    sections = {
      lualine_a = {
        {"mode",
          fmt = function(s) return icons.mode[s] or s end,
          padding = {left = 1, right = 0}, separator = {left = '', right = ''}
        },
      },
      lualine_b = {
        {'branch', separator = {left = '', right = ''}},
        {'diff', separator = {left = '', right = ''}},
      },
      lualine_c = {
        {"diagnostics", padding = {left = 1, right = 0},
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Info
          }
        },
        {"filetype", icon_only = true, padding = {left = 1, right = 0}},
        {"filename", path = 1, padding = {left = 0, right = 0},
          symbols = {
            modified = icons.filestatus.Modified,
            readonly = icons.filestatus.Readonly,
            unnamed = icons.filestatus.Unnamed,
          }
        },
      },
      lualine_x = {
      },
      lualine_y = {
        {"progress", padding = {left = 0, right = 1}, separator = {left = '', right = ''}},
        {"location", padding = {left = 0, right = 1}},
      },
      lualine_z = {
        {"' '", padding = {left = 0, right = 0}, separator = {left = '', right = ''}},
        {"datetime", style = ("%H:%M"), padding = {left = 0, right = 1}},
      },
    },
    tabline = {
      lualine_a = {},
      lualine_b = {
        {"buffers",
          mode = 2,
          hide_filename_extension = true,
          max_length = vim.o.columns * 7/8,
          symbols = {alternate_file = ""},
          padding = {left = 1, right = 1},
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {{"tabs", show_modified_status = false}}
    },
  },
}
