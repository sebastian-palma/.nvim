local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

-- startup and add configure plugins
packer.startup(function()
  local use = use
    -- use 'preservim/nerdtree'
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'};
    use 'junegunn/fzf.vim'
    -- use 'Yggdroot/indentLine'
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'        -- Collection of common configurations for the Nvim LSP client
    use 'nvim-lua/lsp_extensions.nvim' -- Extensions to built-in LSP, for example, providing type inlay hints
    use 'nvim-lua/completion-nvim'     -- Autocompletion framework for built-in LSP
    use 'neovide/neovide'
    use 'nvim-telescope/telescope.nvim'
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
    use 'karb94/neoscroll.nvim'
end)
