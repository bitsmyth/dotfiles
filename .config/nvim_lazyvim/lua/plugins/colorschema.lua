return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        specs = {
          github_dark_default = {
            -- match with wezterm
            bg0 = "#151b23",
            bg1 = "#151b23",
          },
        },
        options = {
          styles = {
            comments = "italic",
          },
        },
      })

      vim.cmd("colorscheme github_dark_default")
    end,
  },
}
