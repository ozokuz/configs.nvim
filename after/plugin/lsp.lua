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
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set(
      'n',
      keys,
      func,
      { buffer = bufnr, desc = desc, noremap = true, silent = true }
    )
  end

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', '<cmd>Lspsaga lsp_finder<CR>', '[G]oto [R]eferences')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gT', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')
  nmap('K', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap(
    '<space>lf',
    vim.lsp.buf.format or vim.lsp.buf.formatting,
    '[F]ormat Document'
  )
  nmap('<space>lc', '<cmd>Lspsaga code_action<CR>', '[C]ode Action')
  nmap('<space>lr', '<cmd>Lspsaga rename<CR>', '[R]ename')
  nmap('<space>lo', '<cmd>LSoutlineToggle<CR>', '[O]utline')

  -- Setup Document Color Support
  if client.server_capabilities.colorProvider then
    require('document-color').buf_attach(bufnr)
  end

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
            -- Ignore TypeScript server provided formatting as prettier should be used instead
            return c.name ~= 'tsserver'
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
