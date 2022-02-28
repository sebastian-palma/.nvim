require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	}
})

require('lspconfig').solargraph.setup({
    flags = {
        debounce_text_changes = 150,
    }
})

local nvim_lsp = require('lspconfig')
local on_attach = function(client)
	require('completion').on_attach(client)
end

nvim_lsp.rust_analyzer.setup {
	on_attach = on_attach,
	settings = {
		['rust-analyzer'] = {
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					'cargo',
					'clippy',
					'--workspace',
					'--message-format=json',
					'--all-targets',
					'--all-features',
				}
			}
		}
	}
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
	}
)
