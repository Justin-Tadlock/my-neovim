return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- LSP Server Settings
      servers = {
        -- TypeScript/JavaScript
        tsserver = {
          settings = {
            typescript = {
              format = { enable = false }, -- Use Prettier instead
            },
            javascript = {
              format = { enable = false },
            },
          },
        },
        -- Go
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },

        -- Bash
        bashls = {
          enabled = true,
        },

        -- Docker
        docker_compose_language_service = {
          enabled = true,
        },
        dockerls = {
          enabled = true,
        },

        -- ESLint
        eslint = {
          enabled = true,
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },

        -- HTML
        html = {
          enabled = true,
        },

        -- JSON
        jsonls = {
          enabled = true,
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        -- Lua
        lua_ls = {
          enabled = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },

        -- YAML
        yamlls = {
          enabled = true,
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },
      },
    },
  },

  -- Optional: Add schemastore for JSON/YAML schemas
  {
    "b0o/schemastore.nvim",
  },
}
