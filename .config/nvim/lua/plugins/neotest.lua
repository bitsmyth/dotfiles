return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    {
      "n1xn/neotest-minitest",
      -- dir = "~/github/neotest-minitest",
      -- dev = true,
    },
  },
  config = function()
    require("neotest").setup({
      -- log_level = vim.log.levels.DEBUG,
      adapters = {
        require("neotest-minitest"),
      },
      icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",
        passed = "",
        running = "",
        failed = "",
        unknown = "",
      },
    })
  end,
}
