return {
    "nvim-lua/plenary.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    {
        "homerours/telescope-jumper",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            local jumper = require("telescope").extensions.jumper
            vim.keymap.set('n', '<c-y>', jumper.jump_to_folder, {})
            vim.keymap.set('n', '<c-u>', jumper.jump_to_file, {})
            vim.keymap.set('n', '<leader>fu', jumper.find_in_files, {})
        end,
    },
    'tpope/vim-surround',
}
