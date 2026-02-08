return {
    "nvim-lua/plenary.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    {
        "ibhagwan/fzf-lua",
    },
    {
        "homerours/jumper.nvim",
        dependencies = { "ibhagwan/fzf-lua" },
        config = function()
            local jumper = require("jumper.fzf-lua")
            vim.keymap.set('n', '<c-y>', function() jumper.jump_to_directory({ on_enter = 'find_files' }) end)
            vim.keymap.set('n', '<c-u>', jumper.jump_to_file)
            vim.keymap.set('n', '<leader>fu', jumper.find_in_files)

            require("jumper").setup({
                jumper_max_results = 300,
                jumper_max_completion_results = 3,
            })
        end,
    },
    'tpope/vim-surround',
}
