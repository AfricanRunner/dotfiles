local M = {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      markdown = { 'prettier', 'injected' },
      html = { 'prettier' },
      lua = { 'stylua' },
      python = { 'yapf' },
      c = { 'clang-format' },
      cc = { 'clang-format' },
      cpp = { 'clang-format' },
      zig = { 'zformat' },
    },
    formatters = {
      stylua = {
        prepend_args = {
          '--indent-type',
          'Spaces',
          '--indent-width',
          '2',
          '--quote-style',
          'AutoPreferSingle',
        },
      },
      prettier = {
        prepend_args = {
          '--prose-wrap',
          'always',
        },
      },
    },
  },
  init = function()
    vim.keymap.set('', '<leader>f', function()
      require('conform').format({ async = true, lsp_fallback = true })
    end)
  end,
}

return { M }
