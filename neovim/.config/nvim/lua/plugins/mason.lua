-- Customize Mason plugins
-- NOTE: Most LSP servers, formatters, and linters are installed by AstroCommunity packs.
-- Only list extras here that packs don't cover.

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- Docker (not using community pack due to mason-lspconfig name mismatch)
        "dockerls",
        "docker_compose_language_service",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "shfmt",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
        "delve",
        "js",
        "codelldb",
        "coreclr",
      },
    },
  },
}
