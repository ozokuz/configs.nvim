require('nvim-treesitter.configs').setup {
  ensure_installed = { 'astro', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css', 'dart', 'dockerfile', 'elixir', 'fish', 'gdscript', 'gitignore', 'glsl', 'go', 'godot_resource', 'gomod', 'graphql', 'help', 'hlsl', 'hocon', 'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'jsonc', 'kotlin', 'latex', 'llvm', 'lua', 'make', 'markdown', 'markdown_inline', 'meson', 'ninja', 'nix', 'perl', 'php', 'phpdoc', 'prisma', 'proto', 'pug', 'python', 'qmljs', 'query', 'rasi', 'rst', 'ruby', 'rust', 'scala', 'scss', 'sql', 'svelte', 'swift', 'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml', 'zig' },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>'
    }
  }
}

-- Enable treesitter based folding
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    vim.opt.foldlevel      = 20
  end
})

require('treesitter-context').setup()
