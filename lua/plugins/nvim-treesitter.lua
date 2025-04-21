return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			ensure_installed = {
				"dart",
				"c",
				"go",
				"clojure",
				"fennel",
				"htmldjango",
				"html",
				"javascript",
				"lua",
				"python",
				"query",
				"ruby",
				"toml",
				"vim",
				"vimdoc",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			indent = {
				enable = true,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPre", "BufNewFile" },
	version = false,
}
