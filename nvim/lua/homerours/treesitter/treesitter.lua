return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies ="nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
        require("nvim-treesitter.install").prefer_git = true
        require 'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "c_sharp", "latex", "bash" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
            },
        }
    end
}
