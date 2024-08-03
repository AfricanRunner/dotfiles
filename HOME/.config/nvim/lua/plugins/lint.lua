local A = {
	"williamboman/mason.nvim",
	config = true,
}

local M = {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "mypy", "flake8" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
				lint.try_lint("cspell")
			end,
		})
	end,
}

local N = {
	"rshkarin/mason-nvim-lint",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
	config = true,
}

return { A, M, N }
