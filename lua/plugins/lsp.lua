local icons = require("config.icons")
local buffer = vim.api.nvim_get_current_buf()

vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    focusable = false,
    header = "",
    source = "always",
    style = "minimal",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
    },
  },
  virtual_text = {
    source = "if_many",
  },
})

vim.lsp.codelens.refresh()
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  buffer = buffer,
  callback = vim.lsp.codelens.refresh,
})

vim.lsp.inlay_hint.enable(true, { bufnr = 0 })

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- local lspconfig = require("lspconfig")
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {}
      )
--TODO: finish lsp
      local default_lsp_config = {
        -- on_attach = on_attach,
        capabilities = capabilities,
      }
      local function setup(servers)
      end
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        icons = {
          package_installed = icons.mason.installed,
          package_pending = icons.mason.pending,
          package_uninstalled = icons.mason.uninstalled,
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {},
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end
      },
    },
  },
}
