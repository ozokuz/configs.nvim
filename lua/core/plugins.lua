return {
  -- Manage itself
  ['wbthomason/packer.nvim'] = {},
  -- The Lodash of Neovim
  ['nvim-lua/plenary.nvim'] = {},
  -- Icons
  ['kyazdani42/nvim-web-devicons'] = {},
  -- Colorscheme
  ['folke/tokyonight.nvim'] = {},
  -- Tmux Integration
  ['alexghergh/nvim-tmux-navigation'] = {},
  -- Statusline
  ['nvim-lualine/lualine.nvim'] = {},
  -- Tabline
  ['akinsho/bufferline.nvim'] = { tag = 'v2.*' },
  -- File Explorer
  ['kyazdani42/nvim-tree.lua'] = {},
  -- Floating Terminal
  ['voldikss/vim-floaterm'] = {},
  -- Show keybinds
  ['folke/which-key.nvim'] = {},
  -- Treesitter
  ['nvim-treesitter/nvim-treesitter'] = {
    run = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
    requires = {
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
  -- LSP
  ['williamboman/mason.nvim'] = {
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'neovim/nvim-lspconfig',
      'folke/trouble.nvim',
      'stevearc/dressing.nvim',
      'lewis6991/hover.nvim',
      'stevearc/aerial.nvim',
      'j-hui/fidget.nvim',
    },
  },
  -- Language specific plugins
  ['folke/lua-dev.nvim'] = {},
  -- Completion
  ['hrsh7th/nvim-cmp'] = {
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
  },
  -- Commenting
  ['numToStr/Comment.nvim'] = {},
  ['JoosepAlviste/nvim-ts-context-commentstring'] = {},
  -- Doc Strings
  ['danymat/neogen'] = {},
  -- Colorizing
  ['NvChad/nvim-colorizer.lua'] = {},
  ['mrshmllow/document-color.nvim'] = {},
  -- Git Signs
  ['lewis6991/gitsigns.nvim'] = {},
  -- Blank line indents
  ['lukas-reineke/indent-blankline.nvim'] = {},
  -- Automatic Indentation
  ['tpope/vim-sleuth'] = {},
  -- Auto Pairs
  ['windwp/nvim-autopairs'] = {},
  ['windwp/nvim-ts-autotag'] = {},
  -- Surround
  ['kylechui/nvim-surround'] = {},
  -- Zen Mode
  ['folke/twilight.nvim'] = {},
  ['folke/zen-mode.nvim'] = {},
  -- Fuzzy Finding
  ['nvim-telescope/telescope.nvim'] = { branch = '0.1.x' },
  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    run = 'make',
  },
  ['nvim-telescope/telescope-live-grep-args.nvim'] = {},
  ['nvim-telescope/telescope-github.nvim'] = {},
}
