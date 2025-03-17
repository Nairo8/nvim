local root = "%:p:h"

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'debugloop/telescope-undo.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer Fuzzy" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
    { "<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "Oldfiles" },
    { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    -- { "<leader>fd", "<cmd>Telescope diagnostics<cr>"({bufnr = 0}), desc = "Diagnostics" },
    -- { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
    { '<leader>f"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    { "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "Explorer" },
    {"<leader>E", function()
      require('telescope').extensions.file_browser.file_browser(
        { path = root, cwd_to_path = true, })
    end, desc = "Explorer (Root)"},
    { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo History" },
  },

  config = function()
    local telescope = require('telescope')
    local fb_actions = telescope.extensions.file_browser.actions
    local undo_actions = require("telescope-undo.actions")

    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        prompt_prefix = " ",
        selection_caret = " ",
        multi_icon = " ",
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          vertical = {
            prompt_position = "top",
            width = 0.8,
          },
          horizontal = {
            prompt_position = "top",
            height = 0.8,
            width = 0.8,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        mappings = {
          i = {
            ["<C-H>"] = "select_horizontal",
            ["<C-J>"] = "move_selection_next",
            ["<C-K>"] = "move_selection_previous",
            ["<C-N>"] = "cycle_history_next",
            ["<C-P>"] = "cycle_history_prev",
          },
          n = {
            ["<C-H>"] = "select_horizontal",
            ["<C-N>"] = "cycle_history_next",
            ["<C-P>"] = "cycle_history_prev",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = "true",
        },
        buffers = {
          path_display = {"truncate"},
          ignore_current_buffer = true,
          mappings = {
            i = {
              ["<M-D>"] = "delete_buffer",
            },
            n = {
              ["d"] = "delete_buffer",
            },
          },
        },
        oldfiles = {
          path_display = {"truncate"}
        },
      },
      extensions = {
        undo = {
          use_delta = true,
          side_by_side = true,
          entry_format = "󰣜  #$ID, $STAT, $TIME",
          mappings = {
            i = {
              ["<C-cr>"] = undo_actions.yank_additions,
              ["<S-cr>"] = undo_actions.yank_deletions,
              ["<cr>"] = undo_actions.restore,
            },
            n = {
              ["y"] = undo_actions.yank_additions,
              ["Y"] = undo_actions.yank_deletions,
              ["<cr>"] = undo_actions.restore,
            },
          },
        },
        file_browser = {
          hidden = {file_browser = true, folder_browser = true},
          hijack_netrw = true,
          depth = 1,
          prompt_path = false,
          mappings = {
            ["n"] = {
              ["<BS>"] = fb_actions.goto_parent_dir,
            }
          },
        },
      },
    })
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
  end,
}
