local commander = require("commander")

-- Wrap the leap function as it's not exposed from the library.
--
-- Use this to avoid `add_default_mappings()` as that adds a different mapping
-- for `s`, `S`, `gS` and so on.
function Leap()
  local fn = function(win)
    return vim.api.nvim_win_get_config(win).focusable
  end

  require("leap").leap {
    target_windows = vim.tbl_filter(
      fn,
      vim.api.nvim_tabpage_list_wins(0)
    )
  }
end


local lazygit = {
  {
    description = "Open Lazygit",
    cmd = "<cmd>LazyGit<cr>",
  },
}
local lspsaga = {
  {
    description = "LSP finder",
    cmd = "<cmd>Lspsaga lsp_finder<cr>",
  },
  {
    description = "LSP Code Action",
    cmd = "<cmd>Lspsaga code_action<cr>",
  },
  {
    description = "LSP rename",
    cmd = "<cmd>Lspsaga rename<cr>",
  },
  {
    description = "LSP rename project",
    cmd = "<cmd>Lspsaga rename ++project<cr>",
  },
  {
    description = "LSP peek definition",
    cmd = "<cmd>Lspsaga peek_definition<cr>",
  },
  {
    description = "LSP finder",
    cmd = "<cmd>Lspsaga lsp_finder<cr>",
  },
  {
    description = "LSP go to definition (vsplit)",
    cmd = ":vsplit | lua vim.lsp.buf.definition()<cr>",
    keys = { "n", "<leader>gtv", { noremap = true } },
  },
  {
    description = "LSP go to definition (split)",
    cmd = ":split | lua vim.lsp.buf.definition()<cr>",
    keys = { "n", "<leader>gtv", { noremap = true } },
  },
  {
    description = "LSP go to definition (same buffer)",
    cmd = "<cmd>Lspsaga goto_definition<cr>",
    keys = { "n", "<leader>gts", { noremap = true } },
  },
  {
    description = "LSP peek type definition",
    cmd = "<cmd>Lspsaga peek_type_definition<cr>",
  },
  {
    description = "LSP go to type definition",
    cmd = "<cmd>Lspsaga goto_type_definition<cr>",
  },
  {
    description = "LSP show line diagnostics",
    cmd = "<cmd>Lspsaga show_line_diagnostics<cr>",
  },
  {
    description = "LSP show buffer diagnostics",
    cmd = "<cmd>Lspsaga show_buf_diagnostics<cr>",
  },
  {
    description = "LSP show workspace diagnostics",
    cmd = "<cmd>Lspsaga show_workspace_diagnostics<cr>",
  },
  {
    description = "LSP show cursor diagnostics",
    cmd = "<cmd>Lspsaga show_cursor_diagnostics<cr>",
  },
  {
    description = "LSP jump to previous diagnostic",
    cmd = "<cmd>Lspsaga diagnostic_jump_prev<cr>",
  },
  {
    description = "LSP jump to next diagnostic",
    cmd = "<cmd>Lspsaga diagnostic_jump_next<cr>",
  },
  {
    description = "LSP toggle outline",
    cmd = "<cmd>Lspsaga outline<cr>",
  },
  {
    description = "LSP hover doc",
    cmd = "<cmd>Lspsaga hover_doc<cr>",
  },
  {
    description = "LSP hover doc (keep window)",
    cmd = "<cmd>Lspsaga hover_doc ++keep<cr>",
  },
  {
    description = "LSP incoming calls",
    cmd = "<cmd>Lspsaga incoming_calls<cr>",
  },
  {
    description = "LSP outgoing calls",
    cmd = "<cmd>Lspsaga outgoing_calls<cr>",
  },
}
local symbols_outline = {
  {
    desc = "Toggle the file structure on the sidebar (symbols-outline)",
    cmd = ":SymbolsOutline<cr>",
    category = "SymbolsOutline",
    keys = { "n", "<leader><cr>", { noremap = true } },
  }
}
local rspec = {
  {
    desc = "Execute all tests in the current file",
    cmd = ":call ExecuteBinRspecFile()<cr>",
    category = "RSpec",
  },
}
local rust = {
  {
    desc = "Show all references in quickfix",
    cmd = ":lua vim.lsp.buf.references()<cr>",
    keys = { "n", "<leader>ra", { noremap = true } }, -- ra, I run out of mnemonics
  },
  {
    desc = "Rename all references (in buffer)",
    cmd = ":lua vim.lsp.buf.rename()<cr>",
    keys = { "n", "<leader>rb", { noremap = true } },
  },
  {
    desc = "Rust code actions in the current file",
    cmd = ":lua vim.lsp.buf.code_action()<cr>",
    keys = { "n", "<leader>rc", { noremap = true } },
  },
  -- {
  --   desc = "Go to definition",
  --   cmd = ":lua vim.lsp.buf.definition({ on_list = handle_go_to_definition })<cr>",
  --   keys = { "n", "<leader>rd", { noremap = true } },
  -- },
  {
    desc = "Display hover information about the symbol under the cursor",
    cmd = ":lua vim.lsp.buf.hover()<cr>",
    keys = { "n", "<leader>re", { noremap = true } },
  },
  {
    desc = "Rust hover actions",
    cmd = ":RustHoverAction<cr>",
    keys = { "n", "<leader>rh", { noremap = true } },
  },
  {
    desc = "Rust runnables in the current file",
    cmd = ":RustRunnables<cr>",
    keys = { "n", "<leader>rr", { noremap = true } },
  },
  {
    desc = "Rust debuggables in the current file",
    cmd = ":RustDebuggables<cr>",
  },
  {
    desc = "Rust run the current app",
    cmd = ":RustRun<cr>",
  },
}
local telescope = {
  {
    description = "Open Telescope",
    cmd = "<cmd>Telescope<cr>",
    keys = { "n", "<leader>tele", { noremap = true } },
  },
  {
    description = "Open Telescope Command Center",
    cmd = "<cmd>Telescope commander<cr>",
    keys = { "n", "<leader>t", { noremap = true } },
  },
  {
    description = "Search inside current buffer",
    cmd = "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    keys = { "n", "<leader>fcf", { noremap = true } },
  },
  {
    description = "Search for files (respecting .gitignore)",
    cmd = "<cmd>Telescope find_files<cr>",
    keys = { "n", "<c-p>", { noremap = true } },
  },
  {
    description = "Open buffers list",
    cmd = "<cmd>Telescope buffers<cr>",
    keys = { "n", "<c-b>", { noremap = true } },
  },
  {
    description = "Search across the whole project",
    cmd = "<cmd>Telescope live_grep<cr>",
    keys = { "n", "<c-s>", { noremap = true } },
  },
  {
    description = "Search string under cursor on the whole project",
    cmd = "<cmd>Telescope grep_string<cr>",
    keys = { "n", "<c-g>", { noremap = true } },
  },
}
local tmux = {
  {
    desc = "Send command to TMUX (right:0)",
    cmd = ":lua send_to_tmux_pane()<cr>",
  },
}
local transparent = {
  {
    desc = "Toggle transparent background",
    cmd = ":TransparentToggle<cr>",
  }
}
local trouble = {
  {
    desc = "Trouble workspace diagnostics",
    cmd = "<cmd>TroubleToggle workspace_diagnostics<cr>",
    keys = { "n", "<leader>trw", { noremap = true } },
  },
  {
    desc = "Trouble document diagnostics",
    cmd = "<cmd>TroubleToggle document_diagnostics<cr>",
    keys = { "n", "<leader>trd", { noremap = true } },
  },
  {
    desc = "Trouble next item",
    cmd = ":lua require('trouble').next({skip_groups = true, jump = true})<cr>",
    keys = { "n", "<leader>trn", { noremap = true } },
  },
  {
    desc = "Trouble previous item",
    cmd = ":lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
    keys = { "n", "<leader>trp", { noremap = true } },
  },
  {
    desc = "Trouble first item",
    cmd = ":lua require('trouble').first({skip_groups = true, jump = true})<cr>",
    keys = { "n", "<leader>trf", { noremap = true } },
  },
  {
    desc = "Trouble last item",
    cmd = ":lua require('trouble').last({skip_groups = true, jump = true})<cr>",
    keys = { "n", "<leader>trl", { noremap = true } },
  },
}
local utils = {
  {
    desc = "Run the last executed command (right:0)",
    cmd = ":lua run_last_executed_command()<cr>",
    keys = { "n", "<leader>rl", { noremap = true } },
  },
  {
    desc = "Choose a window to jump to (vim-choosewin)",
    cmd = ":ChooseWin<cr>",
  },
  {
    desc = "Search pattern and jump to match (leap.nvim)",
    cmd = ":lua Leap()<cr>",
    keys = { "n", "<leader>l", { noremap = true } },
  },
}

commander.add(lazygit, { category = "Git" })
commander.add(lspsaga, { category = "LSPSaga" })
commander.add(symbols_outline, { category = "SymbolsOutline" })
commander.add(rspec, { category = "RSpec" })
commander.add(rust, { category = "Rust" })
commander.add(telescope, { category = "Telescope" })
commander.add(tmux, { category = "TMUX" })
commander.add(transparent, { category = "Transparent" })
commander.add(trouble, { category = "Trouble" })
commander.add(utils, { category = "Utils" })

-- Loading this extension must be after any commander.add() call.
require("telescope").load_extension("commander")
