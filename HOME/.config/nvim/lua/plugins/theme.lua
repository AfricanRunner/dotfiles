local M = {
  'bluz71/vim-nightfly-colors',
  name = 'nightfly',
  lazy = 'false',
  priority = 1000,
  init = function()
    vim.cmd([[colorscheme nightfly]])
  end,
}

local N = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'bluz71/vim-nightfly-colors' },
  opts = function()
    local lualine_nightfly = require('lualine.themes.nightfly')
    return {
      options = {
        theme = lualine_nightfly,
      },
    }
  end,
}

return { M, N }
