return {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
        local path = '~/rangerned/bin/python'
        require('dap-python').setup(path)
    end
}
