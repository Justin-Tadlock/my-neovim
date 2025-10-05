return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Go debugging support
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },
      -- JavaScript/TypeScript debugging support
      {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
          {
            "microsoft/vscode-js-debug",
            version = "1.74.1", -- Use a stable version
            build = "npm ci --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
          },
        },
        opts = {
          debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
        },
      },
    },
    config = function()
      -- nvim-dap-vscode-js automatically sets up configurations for:
      -- javascript, typescript, javascriptreact, typescriptreact
      -- So we only need to add custom configurations if we want them

      -- local dap = require("dap")

      -- Only add additional custom configurations if needed
      -- for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      --   -- Extend existing configurations (don't overwrite what nvim-dap-vscode-js created)
      --   if not dap.configurations[language] then
      --     dap.configurations[language] = {}
      --   end

      --   -- Add custom Jest configuration
      --   table.insert(dap.configurations[language], {
      --     type = "pwa-node",
      --     request = "launch",
      --     name = "Debug Jest Tests",
      --     runtimeExecutable = "node",
      --     runtimeArgs = {
      --       "./node_modules/.bin/jest",
      --       "--runInBand",
      --     },
      --     rootPath = "${workspaceFolder}",
      --     cwd = "${workspaceFolder}",
      --     console = "integratedTerminal",
      --     internalConsoleOptions = "neverOpen",
      --   })
      -- end
    end,
  },
}
