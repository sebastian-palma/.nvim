-- vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd.colorscheme "badwolf"
-- vim.cmd.colorscheme "cinnabar"

vim.api.nvim_set_keymap('n', ',,', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', ',,', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER><SPACE>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>ntff', ':NvimTreeFindFile<CR>', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-Space>', '<C-n>', { noremap = true })

vim.api.nvim_set_keymap('v', 'Y', ':OSCYankVisual<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', ':OSCYankVisual<CR>', { noremap = true })

-- always join lines without the resulting whitespace space in between
vim.api.nvim_set_keymap('n', 'J', 'gJi <ESC>diw', { noremap = true })
-- highlight but don't jump to next occurrence
vim.api.nvim_set_keymap('n', '*', '*``', { noremap = true })

-- easy debugging snippet
vim.cmd([[autocmd FileType python inoremap <C-v> import ipdb; ipdb.set_trace()]])
vim.cmd([[autocmd FileType ruby inoremap <C-v> byebug]])
vim.cmd([[autocmd FileType ruby inoremap <C-b> require 'pry-byebug'; binding.pry]])

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.cmd [[set number relativenumber]]
vim.cmd [[syntax on]]
vim.cmd [[set undofile]]
vim.cmd [[set signcolumn=yes]]
vim.cmd [[set cursorline cursorcolumn]]
vim.cmd [[set nowrap]]

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-left>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-down>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-up>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-right>', '<C-w>l', { noremap = true })
