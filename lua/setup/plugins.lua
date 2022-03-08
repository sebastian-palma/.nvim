local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim' -- ensure that packer is installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	vim.api.nvim_command('packadd packer.nvim')
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'

packer.init({
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function() -- startup and add configure plugins
	local use = use

	use 'neovim/nvim-lspconfig'        -- Collection of common configurations for the Nvim LSP client
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use 'junegunn/fzf.vim'
	use 'nvim-lua/lsp_extensions.nvim' -- Extensions to built-in LSP, for example, providing type inlay hints
	use 'nvim-lua/completion-nvim'     -- Autocompletion framework for built-in LSP
	use 'itchyny/lightline.vim'
	use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'onsails/lspkind-nvim'
	use 'ruanyl/vim-gh-line'
	use 'ojroques/vim-oscyank'
	use 'vim-test/vim-test'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'tversteeg/registers.nvim'
	use 'dense-analysis/ale'
end)
