local o = vim.opt

vim.cmd 'autocmd!'

vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

local has = function(x)
  return vim.fn.has(x) == 1
end

local nvim080 = has 'nvim-0.8.0'
local is_win = has 'win32'

if nvim080 then
  o.cmdheight = 0
else
  o.cmdheight = 1
end

if is_win then
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
o.expandtab = true
o.scrolloff = 10
o.inccommand = 'split'
o.ignorecase = true
o.smarttab = true
o.breakindent = true
o.shiftwidth = 2
o.tabstop = 2
o.ai = true
o.si = true
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
