return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"clojure_lsp",
				"emmet_ls",
				"gopls",
				"graphql",
				"jdtls",
				"lua_ls",
				"prismals",
				"svelte",
				"tailwindcss",
				"ts_ls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"clojure_lsp", -- python formatter
				"eslint", -- prettier formatter
				"eslint_d", -- js linter
				"isort", -- python formatter
				"prettier", -- prettier formatter
				"pyflakes", -- python linter
				"rubocop", -- python formatter
				"ruff", -- python formatter
				"stylua", -- lua formatter
			},
		})
	end,
}
