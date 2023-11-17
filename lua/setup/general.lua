vim.cmd.colorscheme "catppuccin-mocha"
-- vim.cmd.colorscheme "badwolf"
-- vim.cmd.colorscheme "cinnabar"

vim.api.nvim_set_keymap('n', ',,', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', ',,', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER><SPACE>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>ntff',    ':NvimTreeFindFile<CR>', {noremap = true})

vim.api.nvim_set_keymap('v', 'Y', ':OSCYankVisual<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', ':OSCYankVisual<CR>', { noremap = true })

-- always join lines without the resulting whitespace space in between
vim.api.nvim_set_keymap('n', 'J', 'gJi <ESC>diw', { noremap = true })
-- highlight but don't jump to next occurrence
vim.api.nvim_set_keymap('n', '*', '*``', { noremap = true })

-- easy debugging snippet
vim.cmd([[autocmd FileType python inoremap <C-v> import ipdb; ipdb.set_trace()]])
vim.cmd([[autocmd FileType ruby inoremap <C-v> byebug]])

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.cmd [[set number relativenumber]]
