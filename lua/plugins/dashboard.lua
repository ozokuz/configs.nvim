local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('SPC f f', '  Find file'),
  -- dashboard.button('SPC f h', '  Recently opened files'),
  -- dashboard.button('SPC f r', '  Frecency/MRU'),
  dashboard.button('SPC f e', '  File Explorer'),
  dashboard.button('SPC f g', '  Find word'),
  -- dashboard.button('SPC f m', '  Jump to bookmarks'),
  -- dashboard.button('SPC s l', '  Open last session'),
  dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
}

alpha.setup(dashboard.config)
