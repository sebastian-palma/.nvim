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

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
	}
)
