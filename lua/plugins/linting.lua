return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")
    local df = "/df"

		lint.linters_by_ft = {
			clojure = { "clj-kondo" },
			python = { "ruff" },
      ruby = { "standardrb" }
		}

    -- Configure linters per project.
		if vim.fn.getcwd():sub(-#df) == df then
			lint.linters_by_ft.javascript = { "eslint_d" }
			lint.linters_by_ft.javascriptreact = { "eslint_d" }
		else
			lint.linters_by_ft.javascript = { "standardjs" }
			lint.linters_by_ft.javascriptreact = { "standardjs" }
		end

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
