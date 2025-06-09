return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		local javascript = require("formatter.filetypes.javascript")

		-- Unlike the rest, this wraps "erb-formatter" in a custom function
		-- so we can pass --print-width when invoking the executable.
		local erbformatter = function()
			return {
				exe = "erb-formatter",
				args = { util.escape_path(util.get_current_buffer_file_path()), "--print-width", "100" },
				stdin = true,
			}
		end

		local javascript_formatter = function()
			local cwd = vim.fn.getcwd()
			local df = "/df"
			local glbtosvg = "/3d-glbtosvg"

			if cwd:sub(-#df) == df then
				return javascript.eslint_d
			elseif cwd:sub(-#glbtosvg) == glbtosvg then
				return javascript.prettier
			else
				return javascript.standard
			end
		end

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.INFO,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,

					-- You can also define your own configuration
					function()
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},

				dart = {
					require("formatter.filetypes.dart").dartformat,
				},

				eruby = {
					erbformatter,
				},

				javascript = {
          javascript_formatter()
        },

				ruby = {
					require("formatter.filetypes.ruby").standardrb,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
					-- Remove trailing whitespace without 'sed'
					-- require("formatter.filetypes.any").substitute_trailing_whitespace,
				},
			},
		})
	end,
}
