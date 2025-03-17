return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } }
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pyright", "ruff" },
    }
  },
}
