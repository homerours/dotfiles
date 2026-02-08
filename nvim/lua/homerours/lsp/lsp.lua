return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Configure diagnostic signs
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = 'E',
                    [vim.diagnostic.severity.WARN] = 'W',
                    [vim.diagnostic.severity.HINT] = 'H',
                    [vim.diagnostic.severity.INFO] = 'I',
                }
            }
        })

        -- Common on_attach function for all LSP servers
        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end

        -- Get default capabilities for nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
        if has_cmp then
            capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())
        end

        -- Setup LSP servers using new vim.lsp.config API
        vim.lsp.config('pyright', {
            cmd = { 'pyright-langserver', '--stdio' },
            root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config('lua_ls', {
            cmd = { 'lua-language-server' },
            root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                }
            }
        })

        vim.lsp.config('ccls', {
            cmd = { 'ccls' },
            root_markers = { 'compile_commands.json', '.ccls', '.git' },
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Enable LSP servers
        vim.lsp.enable('pyright')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('ccls')
    end
}
