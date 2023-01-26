local setup, null_ls = pcall(require, 'null-ls')
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.stylua.with({
      extra_args = {
        '--indent-type',
        'Spaces',
        '--indent-width',
        '2',
        '--quote-style',
        'AutoPreferSingle',
      },
    }),
    -- formatting.autopep8,
    -- formatting.black.with({ extra_args = { '--skip-string-normalization' } }),
    formatting.yapf.with({ extra_args = { '--style={based_on_style: google, column_limit: 120, indent_width: 4}' } }),
    formatting.clang_format.with({ extra_args = { '--style={BreakBeforeBraces: Allman, IndentWidth: 4}' } }),
    -- diagnostics.cpplint,
    diagnostics.flake8.with({ extra_args = { '--max-line-length', '120' } }),
    diagnostics.mypy,
    diagnostics.eslint_d,
    -- npm install -g cspell
    diagnostics.cspell,
    null_ls.builtins.code_actions.cspell,
  },
  on_attach = function(current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.keymap.set('v', '<leader>f', function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == 'null-ls'
          end,
        })
      end)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == 'null-ls'
          end,
        })
      end)
      -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      -- vim.api.nvim_create_autocmd('BufWritePre', {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format({
      --       filter = function(client)
      --         --  only use null-ls for formatting instead of lsp server
      --         return client.name == 'null-ls'
      --       end,
      --       bufnr = bufnr,
      --     })
      --   end,
      -- })
    end
  end,
})
