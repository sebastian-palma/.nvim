return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- filters = {
			-- 	custom = { "^.git$", ".mjs$" },
			-- 	exclude = {}, -- Optional: files you want to see even if they match custom patterns
			-- },
		})
	end,
}
