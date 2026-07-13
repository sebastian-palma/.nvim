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

    local oxfmt_docker = function()
      return {
        exe = "docker",
        args = { "compose", "exec", "-T", "app", "npx", "oxfmt", "--stdin-filepath",
          util.escape_path(util.get_current_buffer_file_path()), "-" },
        stdin = true,
      }
    end

    local javascript_formatter = function()
      local cwd = vim.fn.getcwd()
      local df = "/df"
      local glbtosvg = "/3d-glbtosvg"
      local dfCompressor = "/df_compressor"

      if cwd:sub(-#df) == df then
        return javascript.eslint_d
      elseif cwd:sub(-#glbtosvg) == glbtosvg then
        return javascript.prettier
      elseif cwd:sub(-#dfCompressor) == dfCompressor then
        return oxfmt_docker
      else
        return javascript.standard
      end
    end

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.INFO,

      filetype = {
        c = {
          require("formatter.filetypes.c").clangformat,
        },

        cpp = {
          require("formatter.filetypes.c").clangformat,
        },

        lua = {
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
          javascript_formatter(),
        },

        python = {
          require("formatter.filetypes.python").ruff,
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

    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        if not vim.g.disable_autoformat and not vim.b.disable_autoformat then
          vim.cmd("FormatWrite")
        end
      end,
    })
  end,
}
