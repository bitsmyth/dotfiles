return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = function(_, opts)
      opts.endwise = { enable = true }
      opts.auto_install = true
      opts.indent = { enable = true }
      -- opts.indent = { enable = true, disable = { "yaml", "ruby" } }
      opts.ensure_installed = {
        "bash",
        "html",
        "json",
        "lua",
        "regex",
        "ruby",
        "embedded_template",
        "tsx",
        "typescript",
        "javascript",
        "markdown",
        "yaml",
      }
    end,
  },
}
