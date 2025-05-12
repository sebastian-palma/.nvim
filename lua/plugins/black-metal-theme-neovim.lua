return {
	"metalelf0/black-metal-theme-neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("black-metal").setup({
			-- theme = "bathory",
			theme = "marduk", -- this one is darker than bathory
			-- theme = "darkthrone", -- too much white
		})
		require("black-metal").load()
	end,
}
