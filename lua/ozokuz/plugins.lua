-- Setup Packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Setup plugins
return require('packer').startup(function(use)
  -- Manage itself
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'folke/tokyonight.nvim'
  -- Tmux Integration
  use 'alexghergh/nvim-tmux-navigation'
  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- LSP
  use {
    'neovim/nvim-lspconfig'
  }
  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }
  }

  -- If packer was just installed then sync plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

