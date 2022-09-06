local nvim080 = vim.fn.has 'nvim-0.8.0' == 1

require('lualine').setup {
  options = {
    globalstatus = true,
  },
  winbar = nvim080 and {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  } or nil,
  inactive_winbar = nvim080 and {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  } or nil,
  extensions = { 'nvim-tree' },
}
