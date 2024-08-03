local M = {
  'lewis6991/gitsigns.nvim',
  config = true,
}

local N = {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false,
    message_template = '  <author>, <date> • <summary>',
    date_format = '%r',
  },
  init = function()
    vim.keymap.set('n', '<leader>g', ':GitBlameToggle<CR>')
  end,
}

return { M, N }
