vim.opt.splitright     = true
vim.opt.mouse          = 'a'
vim.opt.relativenumber = true
vim.opt.splitbelow     = true
vim.opt.backupdir      = '~/.config/nvim/.backup/'
vim.opt.directory      = '~/.config/nvim/.swp/'
vim.opt.undodir        = '~/.config/nvim/.undo/'
vim.wo.wrap            = false
vim.opt.scrolloff      = 16
vim.cmd [[highlight ColorColumn guibg=#171717]]
vim.cmd [[set clipboard=unnamedplus]]


vim.g.mapleader = ','


require('plugins')
require('superhawk610') -- galaxyline theme


-- FZF:
vim.api.nvim_set_keymap('n', '<C-b>', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>',   {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':Lines<CR>',   {noremap = true})
vim.api.nvim_set_keymap('n', '<C-g>', ':Rg<CR>',      {noremap = true})


-- nvim-tree:
vim.api.nvim_set_keymap('n', '<LEADER><SPACE>', ':NvimTreeToggle<CR>', {noremap = true})


-- ZOOM-IN, ZOOM-OUT: 
vim.api.nvim_set_keymap('n', '<LEADER>zi', '<c-w>_ \\| <c-w>\\|', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>zo', '<c-w>=',              {noremap = true})


-- REMAP EASY ESC:
vim.api.nvim_set_keymap('i', ',,', '<Esc>:w<CR>', {noremap = true})


-- disable JSON quotes autohide
vim.g.vim_json_conceal = 0


-- MOVEMENT:
vim.api.nvim_set_keymap('n', '<LEADER>w<Up>',    '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>w<Down>',  '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>w<Left>',  '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>w<Right>', '<C-w>l', {noremap = true})


-- simrat39/rust-tools.nvim
local opts = {
	tools = { -- rust-tools options
	-- Automatically set inlay hints (type hints)
	autoSetHints = true,
	-- Whether to show hover actions inside the hover window
	-- This overrides the default hover handler 
	hover_with_actions = true,

	runnables = {
		-- whether to use telescope for selection menu or not
		use_telescope = true
		-- rest of the opts are forwarded to telescope
	},

	debuggables = {
		-- whether to use telescope for selection menu or not
		use_telescope = true
		-- rest of the opts are forwarded to telescope
	},

	-- These apply to the default RustSetInlayHints command
	inlay_hints = {
		-- Only show inlay hints for the current line
		only_current_line = false,
		-- Event which triggers a refersh of the inlay hints.
		-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
		-- not that this may cause  higher CPU usage.
		-- This option is only respected when only_current_line and
		-- autoSetHints both are true.
		only_current_line_autocmd = "CursorHold",
		-- wheter to show parameter hints with the inlay hints or not
		show_parameter_hints = true,
		-- prefix for parameter hints
		parameter_hints_prefix = "<- ",
		-- prefix for all the other hints (type, chaining)
		other_hints_prefix = "=> ",
		-- whether to align to the length of the longest line in the file
		max_len_align = false,
		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 7
	},

	hover_actions = {
		-- the border that is used for the hover window
		-- see vim.api.nvim_open_win()
		border = {
			{"╭", "FloatBorder"}, {"─", "FloatBorder"},
			{"╮", "FloatBorder"}, {"│", "FloatBorder"},
			{"╯", "FloatBorder"}, {"─", "FloatBorder"},
			{"╰", "FloatBorder"}, {"│", "FloatBorder"}
		},
		-- whether the hover action window gets automatically focused
		auto_focus = true
	}
},

-- all the opts to send to nvim-lspconfig
-- these override the defaults set by rust-tools.nvim
-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
server = {} -- rust-analyer options
}

-- simrat39/rust-tools.nvim
require('rust-tools').setup(opts)


-- neovide conf.
vim.g.neovide_transparency = 0.5
vim.g.neovide_cursor_vfx_mode = 'sonicboom'


-- theme
vim.cmd('colorscheme badwolf') -- set the colorscheme before indent-blankline.nvim to avoid problems
vim.cmd('set fillchars+=vert:│')

-- indent-blankline.nvim
vim.g.indent_blankline_char = '│'
-- vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
vim.cmd [[highlight IndentOne   guifg=#FF0000 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentTwo   guifg=#9400D3 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentThree guifg=#FF7F00 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentFour  guifg=#4B0082 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentFive  guifg=#FFFF00 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentSix   guifg=#0000FF guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentSeven guifg=#00FF00 guibg=NONE gui=nocombine]]
vim.g.indent_blankline_char_highlight_list = {"IndentOne", "IndentTwo", "IndentThree", "IndentFour", "IndentFive", "IndentSix", "IndentSeven"}


-- nvim-bufferline.lua
vim.opt.termguicolors = true
require("bufferline").setup{}


-- karb94/neoscroll.nvim
require('neoscroll').setup()
