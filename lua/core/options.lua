local o = vim.o

vim.cmd 'autocmd!'

vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

require 'core.shell'

o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.title = true
o.autoindent = true
o.hlsearch = true
o.backup = false
o.swapfile = false
o.showcmd = true
o.laststatus = 2
o.scrolloff = 10
o.inccommand = 'split'
o.ignorecase = true
o.smartcase = true
o.breakindent = true
o.wrap = false
o.backspace = 'start,eol,indent'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.formatoptions:append { 'r' }
o.cursorline = true
o.termguicolors = true
o.winblend = 0
o.wildoptions = 'pum'
o.pumblend = 5
o.background = 'dark'
vim.opt.clipboard:append { 'unnamedplus' }

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste',
})

local highlight_group =
  vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
