local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    'tpope/vim-surround',

    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    "nvim-telescope/telescope-fzf-native.nvim",
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    },

    -- Completion
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    'tpope/vim-fugitive',
    'folke/tokyonight.nvim',
    "EdenEast/nightfox.nvim",
    'nvim-lualine/lualine.nvim',
    "mfussenegger/nvim-dap",
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            local path = '~/rangerned/bin/python'
            require('dap-python').setup(path)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }
}
local opts = {}
require("lazy").setup(plugins, opts)
