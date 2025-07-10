return {
	"sebastian-palma/badwolf",
  config = function()
    vim.cmd.colorscheme("badwolf")
  end
}

-- return {
-- 	"metalelf0/black-metal-theme-neovim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("black-metal").setup({
-- 			theme = "marduk", -- this one is darker than bathory
-- 		})
-- 		require("black-metal").load()
-- 	end,
-- }


-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     local catppuccin = require("catppuccin")
--
--     catppuccin.setup({
--       flavour = "latte",
--       background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--       },
--     })
--
--     -- vim.cmd.colorscheme "catppuccin"
--     vim.cmd.colorscheme "catppuccin-latte"
--     -- vim.cmd.colorscheme "catppuccin-frappe"
--     -- vim.cmd.colorscheme "catppuccin-macchiato"
--     -- vim.cmd.colorscheme "catppuccin-mocha"
--
--   end
-- }
