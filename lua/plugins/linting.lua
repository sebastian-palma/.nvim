return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			clojure = { "clj-kondo" },
			javascript = { "standardjs" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "ruff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		function IsNvimDiagnosticsEnabled()
			local clients = vim.lsp.get_clients()
			for _, client in ipairs(clients) do
				if client.server_capabilities.diagnosticProvider then
					return true
				end
			end
			return false
		end
	end,
}
