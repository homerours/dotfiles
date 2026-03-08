return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require('fzf-lua')

        -- Keymaps matching your old telescope setup
        vim.keymap.set('n', '<c-p>', fzf.files, {})
        vim.keymap.set('n', '<leader>ff', fzf.live_grep, {})
        vim.keymap.set('n', '<leader>fh', fzf.command_history, {})
        vim.keymap.set('n', '<leader>fo', fzf.oldfiles, {})
        vim.keymap.set('n', '<leader>fgc', fzf.git_commits, {})
        vim.keymap.set('n', '<leader>fgb', fzf.git_bcommits, {})
        vim.keymap.set('n', '<leader>fc', fzf.blines, {})
        vim.keymap.set('n', '<leader>f*', fzf.grep_cword, {})
        local function open_buf_paths()
            return vim.tbl_map(vim.api.nvim_buf_get_name, vim.tbl_filter(function(b)
                return vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buftype == ''
            end, vim.api.nvim_list_bufs()))
        end
        vim.keymap.set('n', '<leader>fb', function()
            fzf.live_grep({ search_paths = open_buf_paths() })
        end, {})
        vim.keymap.set('n', '<leader>fb*', function()
            fzf.grep_cword({ search_paths = open_buf_paths() })
        end, {})
        vim.keymap.set('n', '<leader>o', fzf.buffers, {})

        -- Configure fzf-lua
        fzf.setup({
            winopts = {
                height = 0.85,
                width = 0.80,
                preview = {
                    default = 'builtin',  -- Use builtin (faster than bat)
                    border = 'border',
                    layout = 'flex',
                    flip_columns = 120,
                    delay = 50,  -- Add small delay to reduce preview spam
                },
            },
            files = {
                file_icons = false,
                -- Use fd (much faster than find) with aggressive exclusions
                cmd = 'fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .cache --exclude .venv --exclude __pycache__',
                find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
                rg_opts = "--files --hidden --follow -g '!.git' -g '!node_modules'",
            },
            git = {
                files = {
                    file_icons = false,
                },
                status = {
                    file_icons = false,
                },
            },
            buffers = {
                file_icons = false,
            },
            oldfiles = {
                file_icons = false,
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
            grep = {
                prompt = 'Grep> ',
                input_prompt = 'Grep For> ',
                rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512",
            },
        })
    end
}
