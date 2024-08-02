local M = {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			markdown = { "prettier", "injected" },
			lua = { "stylua" },
			python = { "yapf" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
	},
	init = function()
		vim.keymap.set("", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end)
	end,
}

local N = {
	"zapling/mason-conform.nvim",
	dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
    config = true,
}

return { M, N }
