local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
local autopairs = require 'nvim-autopairs.completion.cmp'
local keymaps = require('core.keymaps').cmp()

cmp.setup {
  formatting = {
    format = lspkind.cmp_format(),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert(keymaps),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
}

cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({
    { name = 'emoji' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

cmp.event:on('confirm_done', autopairs.on_confirm_done())
