return {
  'echasnovski/mini.ai',
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
  opts = function()
    local ai = require("mini.ai")
    return {
      n_lines = 100,
      custom_textobjects = {
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        c = ai.gen_spec.treesitter({
          a = { "@call.outer", "@class.outer" },
          i = { "@call.inner", "@class.inner" },
        }, {}),
        C = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
        e = { -- Word with case
          { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
          "^().*()$",
        },
        r = ai.gen_spec.treesitter({ a = "@return.outer", i = "@return.inner" }, {}),
        ["#"] = ai.gen_spec.treesitter({ a = "@number.inner", i = "@number.inner" }, {}),
      }
    }
  end,

  config = function(_, opts)
    require("mini.ai").setup(opts)

    local textobject = {
      { " ", desc = "whitespace" },
      { '"', desc = '" string' },
      { "'", desc = "' string" },
      { "`", desc = "` string" },
      { "(", desc = "() block" },
      { ")", desc = "() with ws" },
      { "<", desc = "<> block" },
      { ">", desc = "<> with ws" },
      { "[", desc = "[] block" },
      { "]", desc = "[] with ws" },
      { "{", desc = "{} block" },
      { "}", desc = "{} with ws" },
      { "?", desc = "user prompt" },
      { "#", desc = "number" },
      { "|", desc = "pipe, command" },
      { "a", desc = "assignment" },
      { "b", desc = ")]} block" },
      { "c", desc = "call, class" },
      { "C", desc = "Comment" },
      { "f", desc = "function" },
      { "o", desc = "block, conditional, loop" },
      { "q", desc = "quote `\"'" },
      { "r", desc = "return" },
    }

    local ret = { mode = { "o", "x" } }
    ---@type table<string, string>
    local prefix = vim.tbl_extend("force", {}, {
      around = "a",
      inside = "i",
      around_next = "an",
      inside_next = "in",
      around_last = "al",
      inside_last = "il",
      goto_left = nil,
      goto_right = nil,
    }, opts.mappings or {})

    for group, pre in pairs(prefix) do
      group = group:gsub("^around_", ""):gsub("^inside_", "")
      ret[#ret + 1] = { pre, group = group }
      for _, obj in ipairs(textobject) do
        ret[#ret + 1] = { pre .. obj[1], desc = obj.desc }
      end
    end
    require("which-key").add(ret, { notify = false })

  end
}
