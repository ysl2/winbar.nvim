local config = require('winbar.config')

local M = {}

function M.setup(opts)
    opts = opts or {}
    config.set_options(opts)
    local winbar = require('winbar.winbar')

    winbar.init()
    if config.options.enabled == true then
        vim.api.nvim_create_autocmd({ 'DirChanged', 'CursorMoved', 'BufWinEnter', 'BufFilePost', 'InsertEnter', 'BufWritePost' }, {
            callback = function()
                winbar.show_winbar()
            end
        })
    end
end

return M
