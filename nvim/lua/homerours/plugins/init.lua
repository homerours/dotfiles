return {
    "nvim-lua/plenary.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    {
        dir = "~/Documents/dev/telescope-jumper",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            local jumper = require("telescope").extensions.jumper
            vim.keymap.set('n', '<c-y>', jumper.jump, {})
        end,
    },
    'ThePrimeagen/vim-be-good',
    'tpope/vim-surround',
    -- {"nvim-telescope/telescope-fzf-native.nvim", build = 'make'},
    -- Completion
}
