require('telescope').setup {
  defaults = {
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    mappings = {
      n = {
        ['q'] = require('telescope.actions').close,
      },
    },
  },
}
