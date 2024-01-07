return {
    "nvim-lua/plenary.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    {
        dir = "~/Documents/dev/telescope-jumper",
        config = function()
            local jumper = require("telescope").extensions.jumper
            vim.keymap.set('n', '<c-j>', jumper.jump, {})
        end,
    },
    'ThePrimeagen/vim-be-good',
    'tpope/vim-surround',
    -- {"nvim-telescope/telescope-fzf-native.nvim", build = 'make'},
    -- Completion
}
