require 'ozokuz.core.options'

local keymaps = require 'ozokuz.core.keymaps'

for key, action in pairs(keymaps.normal) do
  vim.keymap.set('n', key, action, keymaps.opts)
end

for keys, action in pairs(keymaps.visual) do
  vim.keymap.set('v', keys, action, keymaps.opts)
end

for keys, config in pairs(keymaps.leader) do
  vim.keymap.set(
    'n',
    '<leader>' .. keys,
    config['a'],
    { noremap = true, silent = true, desc = config['d'] }
  )
end

require 'ozokuz.core.packer'
