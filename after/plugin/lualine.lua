local U = require 'ozokuz.utils'

require('lualine').setup {
  options = {
    globalstatus = true,
  },
  winbar = U.is_nvim_080() and {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  } or nil,
  inactive_winbar = U.is_nvim_080() and {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  } or nil,
  extensions = { 'nvim-tree' },
}
