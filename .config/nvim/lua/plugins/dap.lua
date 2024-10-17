return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "n1xn/nvim-dap-ruby",
      -- dir = "~/github/nvim-dap-ruby/",
      -- dev = true,
    },
  },
  opts = function(_, opts)
    require("dap-ruby").setup()
  end,
}
