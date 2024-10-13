return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function(_, opts)
    local dap = require("dap")

    local strategies = {
      ruby = {
        {
          command = {
            type = "ruby",
            name = "*Debug script",
            request = "launch",
            command = "ruby",
            localfs = true,
            script = "${file}",
          },
          adapter = function(strategy_command)
            return {
              type = "server",
              host = "127.0.0.1",
              port = "${port}",
              executable = {
                command = "rdbg",
                args = {
                  "--open",
                  "--port",
                  "${port}",
                  "-c",
                  "--",
                  strategy_command.command,
                  strategy_command.script,
                },
              },
            }
          end,
        },
        {
          command = {
            type = "ruby",
            name = "*Debug attach",
            request = "attach",
          },
          adapter = function()
            return {
              type = "pipe",
              pipe = "/tmp/ruby",
              executable = {
                command = "rdbg",
                args = {
                  "--attach",
                },
              },
            }
          end,
        },
      },
    }

    -- Function to dynamically build adapters for all strategies
    local function build_adapters(dap, strategies)
      for language, language_strategies in pairs(strategies) do
        dap.adapters[language] = function(callback, config)
          for _, strategy in ipairs(language_strategies) do
            if config.name == strategy.command.name then
              local adapterConfig = strategy.adapter(config)
              callback(adapterConfig)
              return
            end
          end
        end
      end
    end

    -- Function to dynamically build configurations for all strategies
    local function build_configurations(dap, strategies)
      for language, language_strategies in pairs(strategies) do
        local configurations = {}

        for _, strategy in ipairs(language_strategies) do
          table.insert(configurations, strategy.command)
        end

        dap.configurations[language] = configurations
      end
    end

    -- Build adapters and configurations for Ruby
    build_adapters(dap, strategies)
    build_configurations(dap, strategies)
  end,
}
