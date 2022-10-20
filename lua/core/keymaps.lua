local M = {}

M.opts = {
  noremap = true,
  silent = true,
}

-- Set leader key
vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

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
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      if vim.bo.filetype == 'help' then
        vim.api.nvim_feedkeys('K', 'ni', true)
      else
        require('hover').hover()
      end
    end
  end,
  ['gK'] = function()
    require('hover').hover_select()
  end,
  ['öj'] = vim.diagnostic.goto_prev,
  ['ök'] = vim.diagnostic.goto_next,
  ['zR'] = function()
    require('ufo').openAllFolds()
  end,
  ['zM'] = function()
    require('ufo').closeAllFolds()
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
  -- Resize Windows
  ['wr'] = {
    a = function()
      require('smart-splits').start_resize_mode()
    end,
    d = '[W]indow: [R]esize Mode',
  },
  -- Window List
  ['wl'] = { a = '<cmd>Telescope buffers<CR>', d = '[W]indow: [L]ist' },
  -- Quit Without Saving
  ['qq'] = { a = '<cmd>qa!<CR>', d = '[Q]uit: All Without Saving' },
  -- Save & Quit All
  ['qw'] = { a = '<cmd>wall<CR><cmd>qall<CR>', d = '[Q]uit: Save All' },
  -- Git
  ['gg'] = {
    a = '<cmd>Neogit<CR>',
    d = '[G]it: Open',
  },
  ['gr'] = { a = '<cmd>OpenInGHRepo<CR>', d = '[G]it: Open Web Repo' },
  ['gf'] = { a = '<cmd>OpenInGHFile<CR>', d = '[G]it: Open Web File' },
  ['fe'] = {
    a = '<cmd>NvimTreeToggle<CR>',
    d = '[F]iles: File [E]xplorer',
  },
  ['ff'] = {
    a = function()
      require('telescope.builtin').find_files {
        find_command = {
          'rg',
          '--files',
          '--color',
          'never',
          '-g',
          '!.git',
          '--hidden',
        },
      }
    end,
    d = '[F]iles: [F]ind',
  },
  ['fF'] = {
    a = function()
      require('telescope.builtin').find_files {
        find_command = {
          'rg',
          '--files',
          '--color',
          'never',
          '-g',
          '!.git',
          '--hidden',
          '--no-ignore',
        },
      }
    end,
    d = '[F]iles: [F]ind',
  },
  ['fg'] = {
    a = function()
      require('telescope').extensions.live_grep_args.live_grep_args()
    end,
    d = '[F]iles: [G]rep',
  },
  ['ld'] = {
    a = '<cmd>Trouble workspace_diagnostics<CR>',
    d = '[L]sp: [D]iagnostics List',
  },
  ['z'] = {
    a = '<cmd>ZenMode<CR>',
    d = '[Z]en Mode',
  },
  ['sl'] = {
    a = '<cmd>SessionManager load_session<CR>',
    d = '[S]ession: [L]oad',
  },
  ['sL'] = {
    a = '<cmd>SessionManager load_last_session<CR>',
    d = '[S]ession: Load [L]ast',
  },
  ['sd'] = {
    a = '<cmd>SessionManager delete_session<CR>',
    d = '[S]ession: [D]elete',
  },
  ['sc'] = {
    a = '<cmd>SessionManager load_current_dir_session<CR>',
    d = '[S]ession: Load [C]urrent Directory',
  },
  ['ss'] = {
    a = '<cmd>SessionManager save_current_session<CR>',
    d = '[S]ession: [S]ave Current',
  },
  ['tf'] = {
    a = '<cmd>TodoTelescope<CR>',
    d = '[T]odo: [F]ind',
  },
  ['tl'] = {
    a = '<cmd>TodoTrouble<CR>',
    d = '[T]odo: [L]ist',
  },
  ['v'] = {
    a = function()
      require('fold-preview').toggle_preview()
    end,
    d = 'Fold Preview',
  },
}

function M.smart_splits()
  local smart_splits = require 'smart-splits'

  -- resizing splits
  vim.keymap.set('n', '<A-h>', smart_splits.resize_left, M.opts)
  vim.keymap.set('n', '<A-j>', smart_splits.resize_down, M.opts)
  vim.keymap.set('n', '<A-k>', smart_splits.resize_up, M.opts)
  vim.keymap.set('n', '<A-l>', smart_splits.resize_right, M.opts)
  vim.keymap.set('t', '<A-h>', smart_splits.resize_left, M.opts)
  vim.keymap.set('t', '<A-j>', smart_splits.resize_down, M.opts)
  vim.keymap.set('t', '<A-k>', smart_splits.resize_up, M.opts)
  vim.keymap.set('t', '<A-l>', smart_splits.resize_right, M.opts)
  -- moving between splits
  vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left, M.opts)
  vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down, M.opts)
  vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up, M.opts)
  vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right, M.opts)
  vim.keymap.set('t', '<C-h>', smart_splits.move_cursor_left, M.opts)
  vim.keymap.set('t', '<C-j>', smart_splits.move_cursor_down, M.opts)
  vim.keymap.set('t', '<C-k>', smart_splits.move_cursor_up, M.opts)
  vim.keymap.set('t', '<C-l>', smart_splits.move_cursor_right, M.opts)
end

function M.git(lazygit)
  local function toggle_lazygit()
    lazygit:toggle()
  end

  vim.keymap.set('n', '<leader>gl', toggle_lazygit, M.opts)
  vim.keymap.set('t', '<leader>gl', toggle_lazygit, M.opts)
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
  nmap('<leader>lf', function()
    require('plugins.lsp_utils').format()
  end, '[F]ormat')
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
