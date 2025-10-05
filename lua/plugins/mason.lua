return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "typescript-language-server",
        "gopls",
        -- "python-lsp-server", -- commenting python tools for now.
        -- Linters
        "eslint-lsp",
        "golangci-lint",
        -- "ruff",
        -- Formatters
        "prettier",
        "gofumpt",
        -- "black",
        -- DAP
        "node-debug2-adapter",
        "delve",
        -- "debugpy",
      },
    },
  },
}
