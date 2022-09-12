local M = {}

M.opts = {
  noremap = true,
  silent = true,
}

-- Set leader key
vim.g.mapleader = ' '

M.normal = {
  -- No x yank
  ['x'] = '"_x',
  -- Increment & Decrement
  ['+'] = '<C-a>',
  ['-'] = '<C-x>',
  -- Select all
  ['<C-a>'] = 'gg<S-v>G',
  -- Hover Documentation
  ['K'] = function()
    if vim.bo.filetype == 'help' then
      vim.api.nvim_feedkeys('K', 'ni', true)
    else
      require('hover').hover()
    end
  end,
  ['gK'] = function()
    require('hover').hover_select()
  end,
}

M.visual = {
  -- Stay in visual when indenting
  ['<'] = '<gv',
  ['>'] = '>gv',
}

M.leader = {
  -- Tab switching
  ['j'] = { a = '<cmd>tabprevious<CR>', d = 'Tab: Previous' },
  ['k'] = { a = '<cmd>tabnext<CR>', d = 'Tab: Next' },
  -- Split Window
  ['ws'] = { a = '<cmd>split<CR><C-w>w', d = '[W]indow: [S]plit Horizontal' },
  ['wv'] = { a = '<cmd>vsplit<CR><C-w>w', d = '[W]indow: Split [V]ertical' },
  -- Save Buffer
  ['ww'] = { a = '<cmd>w<CR>', d = '[W]indow: Save' },
  -- Save & Close Buffer
  ['wq'] = { a = '<cmd>wq<CR>', d = '[W]indow: Save & Close' },
  -- Destroy Buffer
  ['wd'] = { a = '<cmd>q!<CR>', d = '[W]indow: Destroy' },
  -- Quit Without Saving
  ['qq'] = { a = '<cmd>qa!<CR>', d = '[Q]uit: All Without Saving' },
  -- Save & Quit All
  ['qw'] = { a = '<cmd>wall<CR><cmd>qall<CR>', d = '[Q]uit: Save All' },
  -- lazygit
  ['gl'] = {
    a = '<cmd>FloatermNew --height=0.8 --width=0.8 lazygit<CR>',
    d = '[G]it: [L]azygit',
  },
  ['fe'] = {
    a = '<cmd>NvimTreeToggle<CR>',
    d = '[F]iles: File [E]xplorer',
  },
  ['ff'] = {
    a = '<cmd>Telescope find_files<CR>',
    d = '[F]iles: [F]ind',
  },
  ['fg'] = {
    a = function()
      require('telescope').extensions.live_grep_args.live_grep_args()
    end,
    d = '[F]iles: [G]rep',
  },
}

function M.tmux()
  local tmux = require 'nvim-tmux-navigation'
  local modes = { 'n', 'i', 'v', 'x', 't' }
  local maps = {
    ['<C-h>'] = tmux.NvimTmuxNavigateLeft,
    ['<C-j>'] = tmux.NvimTmuxNavigateDown,
    ['<C-k>'] = tmux.NvimTmuxNavigateUp,
    ['<C-l>'] = tmux.NvimTmuxNavigateRight,
  }

  for _, mode in ipairs(modes) do
    for keys, action in pairs(maps) do
      vim.keymap.set(mode, keys, action, M.opts)
    end
  end
end

function M.terminal()
  vim.keymap.set('n', '<F12>', '<cmd>FloatermToggle integrated<CR>', M.opts)
  vim.keymap.set('t', '<F12>', '<cmd>FloatermToggle integrated<CR>', M.opts)
end

function M.cmp()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'

  return {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }
end

function M.lsp(bufnr)
  local nmap = function(keys, func, desc)
    desc = 'LSP: ' .. desc

    vim.keymap.set(
      'n',
      keys,
      func,
      { buffer = bufnr, desc = desc, noremap = true, silent = true }
    )
  end

  nmap('gd', '<cmd>Telescope lsp_definitions<CR>', '[G]oto [D]efinition')
  nmap(
    'gi',
    '<cmd>Telescope lsp_implementations<CR>',
    '[G]oto [I]mplementation'
  )
  nmap('gr', '<cmd>Telescope lsp_references<CR>', '[G]oto [R]eferences')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap(
    'gT',
    '<cmd>Telescope lsp_type_definitions<CR>',
    '[G]oto [T]ype Definition'
  )
  nmap('<leader>lk', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('<leader>lc', vim.lsp.buf.code_action, '[C]ode Action')
  nmap('<leader>lr', vim.lsp.buf.rename, '[R]ename')
end

function M.aerial(bufnr)
  vim.keymap.set(
    'n',
    '<space>lo',
    '<cmd>AerialToggle!<CR>',
    { buffer = bufnr, desc = '[L]sp: [O]utline', noremap = true, silent = true }
  )
end

return M