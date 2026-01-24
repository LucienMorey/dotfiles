return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,                       -- load immediately
    build = ":TSUpdate",
    branch = "main",
    config = function()
      require("nvim-treesitter.config").setup {
        sync_install = false,
        highlight = { enable = true },
        incremental_selection = { enable = false },
        indent    = { enable = true },
      }
      require("nvim-treesitter").install { 'arduino', 'bash', 'bitbake', 'c', 'cmake', 'cpp', 'devicetree', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'glsl', 'json', 'json5', 'lua', 'markdown', 'python', 'ruby', 'rst', 'tmux', 'vim', 'yaml' }
    end,
  },
  {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  }
}
