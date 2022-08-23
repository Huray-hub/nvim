vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

local set_global_variable = vim.api.nvim_set_var
local keymap = function(mode, lhs, rhs)
    local opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

local command = vim.api.nvim_command

-- Set Space as leader key
keymap('', '<Space>', '<Nop>')
set_global_variable('mapleader', ' ')
set_global_variable('maplocalleader', ' ')

-- Window navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Window resize
keymap('n', '<S-Up>', function()
    command('resize -2')
end)

keymap('n', '<S-Down>', function()
    command('resize +2')
end)

keymap('n', '<S-Left>', function()
    command('vertical resize -2')
end)

keymap('n', '<S-Right>', function()
    command('vertical resize +2')
end)

-- Navigate buffers
keymap('n', '<S-l>', function()
    command('bnext')
end)
keymap('n', '<S-h>', function()
    command('bprevious')
end)
