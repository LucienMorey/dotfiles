return {
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    config = function()
      local material = require("material")

      vim.g.material_style = "oceanic"

      material.setup({
        -- vibrant_syntax = true,
        contrast = {
          cursor_line = true,
        },
        disable = {
          eob_lines = true,
          background = true,
          -- borders = true,
        },
        styles = {
          comments = { italic = true },
          functions = { italic = true },
        },
        plugins = {
          "telescope",
        },
      })

      -- enable the colorscheme
      vim.cmd("colorscheme material")
    end,
  },
}
