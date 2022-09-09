local M = {}

function M.is_win()
  return vim.fn.has 'win32' == 1
end

function M.is_nvim_080()
  return vim.version().minor == 8
end

return M
