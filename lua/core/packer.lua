-- Setup Packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data'
    .. '/site/pack/packer/start/packer.nvim'
  ---@diagnostic disable-next-line: missing-parameter
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

local packer = require 'packer'

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
}

-- Setup plugins
local plugins = require 'core.plugins'

for plugin, config in pairs(plugins) do
  config[1] = plugin

  packer.use(config)
end

-- If packer was just installed then sync plugins
if packer_bootstrap then
  require('packer').sync()
end
