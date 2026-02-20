return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
        vim.env.CC = 'gcc'

        -- Enable treesitter highlighting and auto-install missing parsers
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if not lang then return end
                if not pcall(vim.treesitter.language.inspect, lang) then
                    require('nvim-treesitter.install').install({ lang })
                    return
                end
                pcall(vim.treesitter.start)
            end,
        })

        -- Textobjects config (handled by nvim-treesitter-textobjects)
        require('nvim-treesitter-textobjects').setup {
            select = {
                enable = true,
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
                set_jumps = true,
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
