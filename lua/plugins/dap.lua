return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      -- "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local os = require("os")

      -- Refer to the following link for adapter and configurations:
      -- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

      -- JavaScript/TypeScript recommended adapter
      -- In order to run pwa-node, we need to install vscode-js-debug (Refer to the following link for releases)
      -- https://github.com/microsoft/vscode-js-debug/releases
      -- I just extract the debugger to the plugins directory with the dap.lua plugin file for convenience
      local homeDir = os.getenv("HOME")
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { homeDir .. "/.config/nvim/lua/plugins/js-debug/src/dapDebugServer.js", "${port}" },
        },
      }

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch JS Debug",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
      -- Currently there is an issue with the TS configuration.
      -- The source mappings are not correct for this DAP
      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch TypeScript Debug",
          program = "app.ts",
          cwd = "${workspaceFolder/bin/**/*.js}",
        },
      }

      -- Go
      require("dap-go").setup()

      -- Python, commenting out for now
      -- require("dap-python").setup("python")
    end,
  },
}
