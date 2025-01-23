return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			ensure_installed = {
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
					init_selection = "<C-n>",
					node_incremental = "<C-n>",
					scope_incremental = "<C-s>",
					node_decremental = "<C-m>",
				},
			},
			indent = {
				enable = true,
			},
		})
	end,
	event = { "BufReadPre", "BufNewFile" },
	version = false,
}
