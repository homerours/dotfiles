return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require('nvim-treesitter.configs').setup({
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
                        --
                        -- conditional
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- class
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                    -- include_surrounding_whitespace = true,
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
        })
        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
        -- Repeat movement with ; and ,
        -- ensure ; goes forward and , goes backward regardless of the last direction
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
        -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end
}
