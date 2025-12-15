local M = {
  'neovim/nvim-lspconfig',
  dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
  config = function()

    vim.lsp.config('jedi_language_server', {})
    vim.lsp.config('clangd', {})
    vim.lsp.config('zls', {})

    vim.lsp.config('ltex', {
      settings = {
        ltex = {
          language = 'en',
        },
      },
    })

    vim.lsp.config('lua_ls', {
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

    vim.keymap.set('n', '<leader>d', function()
      vim.diagnostic.open_float()
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
