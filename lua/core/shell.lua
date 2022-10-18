local U = require 'core.utils'
local o = vim.o

if U.is_win() then
  if vim.fn.executable 'pwsh' == 1 then
    o.shell = 'pwsh.exe'
    o.shellcmdflag =
      '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    o.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
    o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    o.shellquote = ''
    o.shellxquote = ''
  else
    o.shell = 'cmd.exe'
  end
elseif vim.fn.executable 'fish' == 1 then
  o.shell = 'fish'
elseif vim.fn.executable 'zsh' == 1 then
  o.shell = 'zsh'
elseif vim.fn.executable 'bash' == 1 then
  o.shell = 'bash'
else
  o.shell = 'sh'
end
