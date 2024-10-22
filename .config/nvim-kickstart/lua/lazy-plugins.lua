-- [[ Recursively load plugins from the 'plugins/' directory ]]
-- This function will scan the 'plugins/' directory and load all
-- Lua files, except those that start with an underscore (`_`).
-- Files and directories with names starting with `_` are considered
-- disabled and will be skipped. It supports a modular structure for
-- plugin configuration.
local function load_plugins()
  local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
  local plugins = {}

  local stack = { plugin_dir }

  while #stack > 0 do
    local current_dir = table.remove(stack)

    local handle = vim.loop.fs_scandir(current_dir)
    if handle then
      while true do
        local name, item_type = vim.loop.fs_scandir_next(handle) -- Rename 'type' to 'item_type'
        if not name then
          break
        end

        local full_path = current_dir .. '/' .. name
        if name:sub(1, 1) ~= '_' then
          if item_type == 'directory' then
            table.insert(stack, full_path)
          elseif item_type == 'file' and name:match '%.lua$' then
            local plugin_name = full_path:match('lua/(.+)%.lua$'):gsub('/', '.')

            local ok, plugin_spec = pcall(require, plugin_name)
            if ok and type(plugin_spec) == 'table' then
              table.insert(plugins, plugin_spec)
            end
          end
        end
      end
    end
  end

  return plugins
end

require('lazy').setup(load_plugins(), {
  ui = {
    icons = vim.g.have_nerd_font and {} or error 'nerd fonts not found, please install to continue',
  },
})

-- vim: ts=2 sts=2 sw=2 et
