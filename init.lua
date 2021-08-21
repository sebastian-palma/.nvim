vim.cmd [[highlight ColorColumn guibg=#171717]]
vim.cmd [[set clipboard=unnamedplus]]
vim.g.mapleader        = ','
vim.opt.splitright     = true
vim.opt.mouse          = 'a'
vim.opt.relativenumber = true
vim.opt.splitbelow     = true
vim.opt.backupdir      = '/home/seb/.config/nvim/.backup//'
vim.opt.directory      = '/home/seb/.config/nvim/.swp//'
vim.opt.undodir        = '/home/seb/.config/nvim/.undo//'
vim.opt.scrolloff      = 16
vim.opt.termguicolors  = true
vim.wo.wrap            = false



require('bufferline').setup({})
require('plugins')
require('superhawk610') -- galaxyline theme
require('rust-tools').setup()
require('nvim-treesitter.configs').setup({
	ensure_installed = {'ruby', 'rust', 'javascript', 'html'},
	highlight = {
		enable = true,
		additional_vim_regex_higlighting = true
	}
})



-- fzf
vim.api.nvim_set_keymap('n', '<C-b>', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>',   {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':Lines<CR>',   {noremap = true})
vim.api.nvim_set_keymap('n', '<C-g>', ':Rg<CR>',      {noremap = true})


-- nvim-tree
vim.api.nvim_set_keymap('n', '<LEADER><SPACE>', ':NvimTreeToggle<CR>', {noremap = true})


-- zoom-in, zoom-out
vim.api.nvim_set_keymap('n', '<LEADER>zi', '<c-w>_ \\| <c-w>\\|', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>zo', '<c-w>=',              {noremap = true})


-- remap easy esc
vim.api.nvim_set_keymap('i', ',,', '<Esc>:w<CR>', {noremap = true})


-- disable JSON quotes autohide
vim.g.vim_json_conceal = 0


-- movement
vim.api.nvim_set_keymap('n', '<LEADER>w<Up>',    '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>w<Down>',  '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>w<Left>',  '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>w<Right>', '<C-w>l', {noremap = true})


-- neovide conf.
vim.g.neovide_transparency = 0.5
vim.g.neovide_cursor_vfx_mode = 'sonicboom'


-- theme
vim.cmd('colorscheme badwolf') -- set the colorscheme before indent-blankline.nvim to avoid problems
vim.cmd('set fillchars+=vert:│')


-- indent-blankline.nvim
vim.g.indent_blankline_char = '│'
-- vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
vim.cmd [[highlight IndentOdd  guifg=#635C57 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentEven guifg=#403C39 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentOne   guifg=#FF0000 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentTwo   guifg=#9400D3 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentThree guifg=#FF7F00 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFour  guifg=#4B0082 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFive  guifg=#FFFF00 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSix   guifg=#0000FF guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSeven guifg=#00FF00 guibg=NONE gui=nocombine]]
vim.g.indent_blankline_char_highlight_list = {"IndentOdd", "IndentEven"}
-- vim.g.indent_blankline_char_highlight_list = {"IndentOne", "IndentTwo", "IndentThree", "IndentFour", "IndentFive", "IndentSix", "IndentSeven"}


-- karb94/neoscroll.nvim
require('neoscroll').setup()
