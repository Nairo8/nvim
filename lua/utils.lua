local M = {}

function M.keymap(mode, lhs, rhs, opts)
  mode = mode or "n"
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

local highlights = {
  "Normal",
  "NormalNC",
  "EndOfBuffer"
}

function M.toggle_transparency()
  local color = vim.g.colors_name
  local transparent = vim.api.nvim_get_hl(0, { name = highlights[1] })
  if transparent.bg then
    for _, highlight in ipairs(highlights) do
      vim.api.nvim_set_hl(0, highlight, { fg = "fg", bg = "none" })
    end
  else
    vim.cmd("colorscheme " .. color)
  end
end

function M.is_win(par1, par2)
  if vim.fn.has('win32') then
    return par1
  else
    return par2
  end
end

return M
