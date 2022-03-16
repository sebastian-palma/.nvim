vim.cmd [[highlight ColorColumn guibg=#171717]]
vim.cmd [[set clipboard=unnamedplus]]
vim.cmd [[set shortmess+=c]]
vim.cmd [[set nu]]
vim.cmd [[set undofile]]
vim.cmd [[set noshowmode]]
vim.cmd [[set foldmethod=manual]]
vim.cmd [[set ttyfast]]
vim.cmd [[set lazyredraw]]
-- vim.cmd [[set shiftwidth=2]]
vim.cmd [[set re=0]]
vim.g.mapleader        = ','
vim.g.vim_json_conceal = 0 -- disable JSON quotes autohide
vim.o.completeopt      = 'menuone,noinsert,noselect'
vim.opt.splitright     = true
vim.opt.mouse          = 'a'
vim.opt.splitbelow     = true
vim.opt.backupdir      = '/home/seb/.config/nvim/.backup//'
vim.opt.directory      = '/home/seb/.config/nvim/.swp//'
vim.opt.undodir        = '/home/seb/.config/nvim/.undo//'
vim.opt.scrolloff      = 16
vim.opt.termguicolors  = true
vim.wo.wrap            = false
