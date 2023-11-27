local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pylsp.setup {
  on_attach = nil,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "use", "vim" }
      }
    }
  }
}

lspconfig.solargraph.setup {}
