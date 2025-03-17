local function config(module)
  return require("config." .. module)
end

config("options")
config("lazy")
config("autocmds")
config("keymaps")

-- TODO: plugins
-- lsp_signature
-- navic
-- navbuddy / aerial
-- trouble
-- dap
-- gitgraph
-- ?fzf
