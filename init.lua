-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{'Failed to clone lazy.nvim:\n', 'ErrorMsg'}, {out, 'WarningMsg'},
                           {'\nPress any key to exit...'}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({{
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {}
}})

-- Rebind

-- from mi/mI
vim.keymap.set({'n', 'x'}, 'i', cursors.start_left)
vim.keymap.set({'n', 'x'}, 'I', cursors.start_left_edge)
-- from ma/mA
vim.keymap.set({'n', 'x'}, 'a', cursors.start_right)
vim.keymap.set({'n', 'x'}, 'A', cursors.start_right_edge)
