local M = {
  'neovim/nvim-lspconfig',
  dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.jedi_language_server.setup({})
    lspconfig.clangd.setup({})

    lspconfig.lua_ls.setup({
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    })

    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end)

    vim.keymap.set('n', '<leader>ca', function()
      vim.lsp.buf.code_action()
    end)

    vim.keymap.set('n', '<leader>rn', function()
      vim.ui.input({ prompt = 'Rename: ', default = vim.fn.expand('<cword>') }, function(name)
        vim.lsp.buf.rename(name)
      end)
    end)
  end,
}

local N = {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  opts = {
    automatic_installation = true,
  },
}

return { M, N }
