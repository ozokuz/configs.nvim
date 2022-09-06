local wk = require 'which-key'
wk.setup()
wk.register({
  f = { name = 'Files' },
  g = { name = 'Git' },
  w = { name = 'Windows' },
  q = { name = 'Quit' },
  l = { name = 'LSP' },
  t = { name = 'Tabs' },
}, { prefix = '<leader>' })
