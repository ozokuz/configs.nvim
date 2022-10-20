require 'core.options'
require 'core.shell'
require 'core.yankhl'
require 'core.keysetup'

local bootstrap = require 'core.packer'

if bootstrap then
  print '==============================='
  print '  Plugins are being installed. '
  print '  Restart Neovim after plugin  '
  print '   installation is complete.   '
  print '==============================='
  return
end

require 'plugins'
