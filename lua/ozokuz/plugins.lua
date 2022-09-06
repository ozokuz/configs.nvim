-- Setup Packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data'
    .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Setup plugins
return require('packer').startup(function(use)
  -- Manage itself
  use 'wbthomason/packer.nvim'
  -- The Lodash of Neovim
  use 'nvim-lua/plenary.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Colorscheme
  use 'folke/tokyonight.nvim'
  -- Tmux Integration
  use 'alexghergh/nvim-tmux-navigation'
  -- Statusline
  use 'nvim-lualine/lualine.nvim'
  -- Tabline
  use { 'akinsho/bufferline.nvim', tag = 'v2.*' }
  -- File Tree
  use 'kyazdani42/nvim-tree.lua'
  -- Floating Terminal
  use 'voldikss/vim-floaterm'
  -- Show keybinds
  use 'folke/which-key.nvim'
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
    requires = {
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  }
  -- LSP
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    requires = {
      'lewis6991/hover.nvim',
      'stevearc/aerial.nvim',
      'j-hui/fidget.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'neovim/nvim-lspconfig',
    },
  }
  -- Language specific plugins
  use 'folke/lua-dev.nvim'
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
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
  }
  -- Commenting
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- Doc Strings
  use 'danymat/neogen'
  -- Colorizing
  use 'norcalli/nvim-colorizer.lua'
  use 'mrshmllow/document-color.nvim'
  -- Git Signs
  use 'lewis6991/gitsigns.nvim'

  -- If packer was just installed then sync plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
