local M = {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    ts.setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        if not vim.tbl_contains(ts.get_available(), lang) then
          return
        end
        if not vim.tbl_contains(ts.get_installed(), lang) then
          ts.install(lang)
        end
        vim.treesitter.start(args.buf, lang)
      end,
    })
  end,
}

return { M }
