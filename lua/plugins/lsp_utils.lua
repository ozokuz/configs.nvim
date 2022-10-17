local M = {}

M.formatting_ignore = { 'tsserver', 'jsonls' }

function M.format(bufnr)
  vim.lsp.buf.format {
    buffer = bufnr,
    filter = function(c)
      -- Ignore some language servers' formatting
      -- when a standalone formatting tool should be used instead
      return not vim.tbl_contains(M.formatting_ignore, c.name)
    end,
  }
end

return M
