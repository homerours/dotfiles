require('homerours')
vim.opt.path:append '**'
vim.cmd("colorscheme nightfox")

-- netrw
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
        end

        -- edit new file
        bind('n', '%')

        -- rename file
        bind('r', 'R')

        bind('l', '<CR>')
    end
})
