return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.header = vim.split(string.rep("\n", 13), "\n")
    end,
  },
}
