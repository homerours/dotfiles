return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gl", ":Gclog<CR>")
        vim.keymap.set("n", "<leader>gi", ":Gvdiffsplit<CR>")
    end
}
