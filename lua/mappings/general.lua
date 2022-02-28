-- zoom-in
vim.api.nvim_set_keymap('n', '<LEADER>zi', '<c-w>_ | <c-w>|', {noremap = true})
-- zoom-out
vim.api.nvim_set_keymap('n', '<LEADER>zo', '<c-w>=',          {noremap = true})


-- remap easy esc
vim.api.nvim_set_keymap('i', ',,', '<Esc>:w<CR>', {noremap = true})


-- remap yanking to use OSCYank
vim.api.nvim_set_keymap('v', 'Y', ':OSCYank<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', 'Y', ':OSCYank<CR>', {noremap=true})
