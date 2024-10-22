return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        specs = {
          github_dark_dimmed = {
            -- match with wezterm
            bg0 = "#22272E",
            bg1 = "#22272E",
          },
        },
        options = {
          styles = {
            comments = "italic",
          },
        },
      })

      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
}
