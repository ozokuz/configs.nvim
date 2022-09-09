local M = {}

function M.has(x)
  return vim.fn.has(x) == 1
end

function M.is_win()
  return M.has 'win32'
end

function M.is_nvim_080()
  return M.has 'nvim-0.8.0'
end

return M
