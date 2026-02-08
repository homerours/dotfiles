return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
        require('nvim-treesitter').setup {
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

            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- function
                        ["am"] = "@function.outer",
                        ["im"] = "@function.inner",

                        -- conditional
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",

                        -- loop
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- class
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]c"] = "@class.outer",
                        ["]i"] = "@conditional.outer",
                        ["]l"] = "@loop.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]C"] = "@class.outer",
                        ["]I"] = "@conditional.outer",
                        ["]L"] = "@loop.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[c"] = "@class.outer",
                        ["[i"] = "@conditional.outer",
                        ["[l"] = "@loop.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[C"] = "@class.outer",
                        ["[I"] = "@conditional.outer",
                        ["[L"] = "@loop.outer",
                    }
                },
            },
        }

        -- Setup repeatable moves with ; and , (if available)
        local ok, ts_repeat_move = pcall(require, "nvim-treesitter.textobjects.repeatable_move")
        if ok then
            vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
            vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
            -- Make builtin f, F, t, T also repeatable with ; and ,
            vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
            vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
            vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
            vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
        end
    end
}
