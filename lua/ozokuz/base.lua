local o = vim.opt

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

local nvim080 = vim.fn.has("nvim-0.8.0")

if (nvim080 == 1) then
  o.cmdheight = 0
else
  o.cmdheight = 1
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
o.shell = 'fish'
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

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

