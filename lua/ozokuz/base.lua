local U = require 'ozokuz.utils'

local o = vim.opt

vim.cmd 'autocmd!'

vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

if U.is_nvim_080() then
  o.cmdheight = 0
else
  o.cmdheight = 1
  o.mouse = 'a'
end

if U.is_win() then
  o.shell = 'pwsh.exe'
else
  o.shell = 'fish'
end

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
o.breakindent = true
o.wrap = false
o.backspace = 'start,eol,indent'
o.path:append { '**' }
o.wildignore:append { '*/node_modules/*' }
o.formatoptions:append { 'r' }
o.cursorline = true
o.termguicolors = true
o.winblend = 0
o.wildoptions = 'pum'
o.pumblend = 5
o.background = 'dark'
o.clipboard:append { 'unnamedplus' }

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste',
})
