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
            vim.keymap.set('n', '<c-u>', jumper.jump_file, {})

            vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
                pattern = { "*" },
                callback = function(ev)
                    local filename = vim.api.nvim_buf_get_name(ev.buf)
                    if not string.find(filename, "/.git") then
                        local cmd = 'jumper -f ${jumpfile_files} -a ' .. filename
                        os.execute(cmd)
                    end
                end
            })
        end,
    },
    -- "homerours/telescope-jumper",
    'ThePrimeagen/vim-be-good',
    'tpope/vim-surround',
    -- {"nvim-telescope/telescope-fzf-native.nvim", build = 'make'},
    -- Completion
}
