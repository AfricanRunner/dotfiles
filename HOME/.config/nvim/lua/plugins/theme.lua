local M = {
  'dasupradyumna/midnight.nvim',
  -- opts = {
  --   HighlightGroup = {
  --     bg = 'black',
  --   },
  -- },
  init = function()
    vim.cmd.colorscheme('midnight')
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'black' })
  end,
}

-- local M = {
--   'bluz71/vim-nightfly-colors',
--   name = 'nightfly',
--   lazy = 'false',
--   priority = 1000,
--   init = function()
--     vim.cmd([[colorscheme nightfly]])
--   end,
-- }

local N = {
  'nvim-lualine/lualine.nvim',
  -- dependencies = { 'nvim-tree/nvim-web-devicons', 'bluz71/vim-nightfly-colors' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    -- local lualine_nightfly = require('lualine.themes.nightfly')
    -- return {
    --   options = {
    --     -- theme = lualine_nightfly,
    --     -- theme = require('')
    --   },
    -- }
    return {
      options = {
        theme = 'auto',
      },
    }
  end,
}

return { M, N }
