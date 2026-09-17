-- return {
-- 	"sebastian-palma/badwolf",
--   config = function()
--     vim.cmd.colorscheme("badwolf")
--   end
-- }

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
--   lazy = false,
--   priority = 1000,
--   opts = {
--     flavour = "macchiato", -- latte, frappe, macchiato, mocha
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--     vim.cmd.colorscheme "catppuccin"
--   end,
-- }

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.o.background = "light" -- or "dark" for dark mode
    vim.cmd([[colorscheme gruvbox]])
  end,
  opts = {},
}
