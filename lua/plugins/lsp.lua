local U = require 'core.utils'
local keymaps = require 'core.keymaps'

-- Setup Capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Add color provider capability
capabilities.textDocument.colorProvider = {
  dynamicRegistration = true,
}

-- Setup Formatting augroup
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Setup Attach Configuration
local on_attach = function(client, bufnr)
  -- Setup Keymaps
  keymaps.lsp(bufnr)

  -- Setup Document Color Support
  if client.server_capabilities.colorProvider then
    require('document-color').buf_attach(bufnr)
  end

  -- Setup Document Outline Support
  require('aerial').on_attach(client, bufnr)

  -- Setup Formatting Support
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format {
          buffer = bufnr,
          filter = function(c)
            -- Ignore some language servers' formatting
            -- when a standalone formatting tool should be used instead
            return c.name ~= 'tsserver' and c.name ~= 'jsonls'
          end,
        }
      end,
    })
  end
end

-- Setup LSP Installer
require('mason').setup()
require('mason-lspconfig').setup()

-- LSP Status Indicator
require('fidget').setup()

-- LSP Document Outline
require('aerial').setup {
  on_attach = function(bufnr)
    keymaps.aerial(bufnr)
  end,
}

-- LSP Hover UI
require('hover').setup {
  init = function()
    require 'hover.providers.lsp'
    require 'hover.providers.gh'
    if not U.is_win() then
      require 'hover.providers.man'
    end
  end,
}

-- LSP UI
require('lspsaga').init_lsp_saga {
  move_in_saga = { prev = '<C-d>', next = '<C-f>' },
}

-- Setup LSP Servers
local lspconfig = require 'lspconfig'
require('mason-lspconfig').setup_handlers {
  -- Generic Configuration
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,

  -- Language Specific Configuration
  -- Neovim Lua
  ['sumneko_lua'] = function()
    local luadev = require('lua-dev').setup {
      lspconfig = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
    }
    lspconfig.sumneko_lua.setup(luadev)
  end,
}

-- Setup Linters & Formatters
local null_ls = require 'null-ls'

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.selene,
  },
}

vim.diagnostic.config {
  virtual_text = {
    source = 'always',
  },
}
