require('document-color').setup {
  mode = 'background'
}

require('colorizer').setup({
  '*';
  '!css';
  '!html';
  '!tsx';
  '!dart';
})

