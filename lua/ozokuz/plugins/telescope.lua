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

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'live_grep_args'
require('telescope').load_extension 'gh'
