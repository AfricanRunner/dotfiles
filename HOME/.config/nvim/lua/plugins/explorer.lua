local M = {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

    require('nvim-tree').setup({
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 75,
        relativenumber = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end,
}

return { M }
