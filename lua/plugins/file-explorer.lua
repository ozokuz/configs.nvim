require('nvim-tree').setup {
  renderer = {
    highlight_git = true,
  },
  filters = {
    custom = { '^.git$' },
  },
  view = {
    mappings = {
      list = {
        { key = 'h', action = 'close_node' },
        { key = 'l', action = 'edit' },
        { key = '+', action = 'cd' },
      },
    },
  },
  open_on_tab = true,
}

-- TODO: bugs out when opening plugin windows when only NvimTree is open
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('NvimTreeClose', { clear = true }),
  callback = function()
    local layout = vim.api.nvim_call_function('winlayout', {})

    if layout[1] ~= 'leaf' then
      return
    end

    local buffer = vim.api.nvim_win_get_buf(layout[2])
    local filetype = vim.api.nvim_buf_get_option(buffer, 'filetype')
    local is_nvim_tree = filetype == 'NvimTree'

    if is_nvim_tree and layout[3] == nil then
      vim.cmd 'confirm quit'
    end
  end,
})
