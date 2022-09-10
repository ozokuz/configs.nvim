require('document-color').setup {
  mode = 'background',
}

require('colorizer').setup {
  filetypes = {
    '*',
    '!css',
    '!html',
    '!tsx',
    '!dart',
  },
}
