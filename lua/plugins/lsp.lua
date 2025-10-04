return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- LSP Server Settings
      servers = {
        -- TypeScript/JavaScript
        tsserver = {
          enabled = true,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },

        -- Deno (disabled by default to avoid conflicts with tsserver)
        denols = {
          enabled = false,
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
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

        -- Go
        gopls = {
          enabled = true,
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
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

        -- Python
        pyright = {
          enabled = true,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
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

      -- Setup handlers for automatic server setup
      setup = {
        -- Disable tsserver when deno.json is present
        tsserver = function(_, opts)
          local lspconfig = require("lspconfig")
          local function is_deno_project()
            return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd())
          end

          if not is_deno_project() then
            require("lspconfig").tsserver.setup(opts)
          end
        end,

        -- Enable denols only for Deno projects
        denols = function(_, opts)
          local lspconfig = require("lspconfig")
          local function is_deno_project()
            return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd())
          end

          if is_deno_project() then
            require("lspconfig").denols.setup(opts)
          end
        end,
      },
    },
  },

  -- Optional: Add schemastore for JSON/YAML schemas
  {
    "b0o/schemastore.nvim",
  },
}
