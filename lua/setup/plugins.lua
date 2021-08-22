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
    -- use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'};
    -- use 'junegunn/fzf.vim'
    use 'neovim/nvim-lspconfig'        -- Collection of common configurations for the Nvim LSP client
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-lua/lsp_extensions.nvim' -- Extensions to built-in LSP, for example, providing type inlay hints
    use 'nvim-lua/completion-nvim'     -- Autocompletion framework for built-in LSP
    use 'neovide/neovide'
    use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    -- use 'karb94/neoscroll.nvim'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'onsails/lspkind-nvim'
end)
