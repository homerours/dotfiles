return {
    'saghen/blink.cmp',
    version = '*',
    opts = {
        keymap = {
            preset = 'none',
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-space>'] = { 'show', 'fallback' },
        },
        appearance = { nerd_font_variant = 'none', kind_icons = {} },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },
        completion = {
            accept = { auto_brackets = { enabled = true } },
            menu = {
                draw = {
                    columns = { { 'label', 'label_description', gap = 1 }, { 'kind' } },
                },
            },
        },
    },
}
