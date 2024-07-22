return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local current_dir = vim.fn.getcwd()

		-- Disable auto-formatting for certain projects.
		if current_dir ~= "/mnt/quipuapp-front" then
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					css = { "prettier" },
					graphql = { "prettier" },
					html = {},
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					markdown = { "prettier" },
					python = { "isort", "black" },
					svelte = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					yaml = { "prettier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end
	end,
}
