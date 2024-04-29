return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local layout_actions = require('telescope.actions.layout')
        vim.keymap.set('n', '<c-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fh', builtin.command_history, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>fgb', builtin.git_bcommits, {})
        vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>f*', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>fb', function()
            builtin.live_grep({ grep_open_files = true })
        end, {})
        vim.keymap.set('n', '<leader>fb*', function()
            builtin.grep_string({ grep_open_files = true })
        end, {})
        vim.keymap.set('n', '<leader>o', builtin.buffers, {})
        -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        local actions = require('telescope.actions')
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-t>"] = actions.file_tab,
                        ["<C-e>"] = actions.file_edit,
                        ["<C-p>"] = layout_actions.toggle_preview
                    }
                }
            }
        }
    end
}
