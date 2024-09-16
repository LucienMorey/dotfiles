return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        event = {
            'BufReadPost',
            'BufNewFile',
        },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { 'arduino', 'bash', 'bitbake', 'c', 'cmake', 'cpp', 'devicetree', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'glsl', 'json', 'json5', 'lua', 'markdown', 'python', 'ruby', 'rst', 'tmux', 'vim', 'yaml' },
                sync_install = false,
                highlight = { enable = true },
                incremental_selection = { enable = false },
                indent = { enable = true },
            }

            vim.cmd 'set foldexpr=nvim_treesitter#foldexpr()'
        end,
    }
}
