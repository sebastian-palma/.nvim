vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1

require('nvim-tree').setup {
	system_open = {
		cmd = '/usr/local/bin/neovide',
		args = {
			'--maximized',
			'--multigrid',
		}
	}
}
