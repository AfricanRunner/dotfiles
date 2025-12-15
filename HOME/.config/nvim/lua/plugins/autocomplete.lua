local M = {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  opts = function()
    local cmp = require('cmp')
    return {
      mapping = cmp.mapping.preset.insert({}),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- lsp
        { name = 'luasnip' }, -- snippets
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
      }),
      enable = function()
        return vim.fn.expand('%:e') ~= 'md'
      end,
    }
  end,
  init = function()
    local cmp = require('cmp')
    cmp.setup.filetype('markdown', {
      sources = {},
    })
  end,
}

return { M }
