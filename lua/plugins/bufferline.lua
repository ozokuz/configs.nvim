require('bufferline').setup {
  options = {
    mode = 'tabs',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true,
      },
    },
  },
}
