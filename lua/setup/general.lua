-- zoom-in, zoom-out
vim.api.nvim_set_keymap('n', '<LEADER>zi', '<c-w>_ \\| <c-w>\\|', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>zo', '<c-w>=',              {noremap = true})


-- remap easy esc
vim.api.nvim_set_keymap('i', ',,', '<Esc>:w<CR>', {noremap = true})
