local commander = require("commander")

-- Wrap the leap function as it's not exposed from the library.
--
-- Use this to avoid `add_default_mappings()` as that adds a different mapping
-- for `s`, `S`, `gS` and so on.
function Leap()
	local fn = function(win)
		return vim.api.nvim_win_get_config(win).focusable
	end

	require("leap").leap({
		target_windows = vim.tbl_filter(fn, vim.api.nvim_tabpage_list_wins(0)),
	})
end

local lazygit = {
	{
		desc = "Open Lazygit",
		cmd = "<cmd>LazyGit<cr>",
	},
}
local lspsaga = {
	{
		desc = "LSP finder",
		cmd = "<cmd>Lspsaga lsp_finder<cr>",
	},
	{
		desc = "LSP Code Action",
		cmd = "<cmd>Lspsaga code_action<cr>",
	},
	{
		desc = "LSP rename",
		cmd = "<cmd>Lspsaga rename<cr>",
	},
	{
		desc = "LSP rename project",
		cmd = "<cmd>Lspsaga rename ++project<cr>",
	},
	{
		desc = "LSP peek definition",
		cmd = "<cmd>Lspsaga peek_definition<cr>",
	},
	{
		desc = "LSP finder",
		cmd = "<cmd>Lspsaga lsp_finder<cr>",
	},
	{
		desc = "LSP go to definition (vsplit)",
		cmd = ":vsplit | lua vim.lsp.buf.definition()<cr>",
		keys = { "n", "<leader>gtv", { noremap = true } },
	},
	{
		desc = "LSP go to definition (split)",
		cmd = ":split | lua vim.lsp.buf.definition()<cr>",
		keys = { "n", "<leader>gtv", { noremap = true } },
	},
	{
		desc = "LSP go to definition (same buffer)",
		cmd = "<cmd>Lspsaga goto_definition<cr>",
		keys = { "n", "<leader>gts", { noremap = true } },
	},
	{
		desc = "LSP peek type definition",
		cmd = "<cmd>Lspsaga peek_type_definition<cr>",
	},
	{
		desc = "LSP go to type definition",
		cmd = "<cmd>Lspsaga goto_type_definition<cr>",
	},
	{
		desc = "LSP show line diagnostics",
		cmd = "<cmd>Lspsaga show_line_diagnostics<cr>",
	},
	{
		desc = "LSP show buffer diagnostics",
		cmd = "<cmd>Lspsaga show_buf_diagnostics<cr>",
	},
	{
		desc = "LSP show workspace diagnostics",
		cmd = "<cmd>Lspsaga show_workspace_diagnostics<cr>",
	},
	{
		desc = "LSP show cursor diagnostics",
		cmd = "<cmd>Lspsaga show_cursor_diagnostics<cr>",
	},
	{
		desc = "LSP jump to previous diagnostic",
		cmd = "<cmd>Lspsaga diagnostic_jump_prev<cr>",
	},
	{
		desc = "LSP jump to next diagnostic",
		cmd = "<cmd>Lspsaga diagnostic_jump_next<cr>",
	},
	{
		desc = "LSP toggle outline",
		cmd = "<cmd>Lspsaga outline<cr>",
	},
	{
		desc = "LSP hover doc",
		cmd = "<cmd>Lspsaga hover_doc<cr>",
	},
	{
		desc = "LSP hover doc (keep window)",
		cmd = "<cmd>Lspsaga hover_doc ++keep<cr>",
	},
	{
		desc = "LSP incoming calls",
		cmd = "<cmd>Lspsaga incoming_calls<cr>",
	},
	{
		desc = "LSP outgoing calls",
		cmd = "<cmd>Lspsaga outgoing_calls<cr>",
	},
}
local symbols_outline = {
	{
		desc = "Toggle the file structure on the sidebar (symbols-outline)",
		cmd = ":SymbolsOutline<cr>",
		category = "SymbolsOutline",
		keys = { "n", "<leader><cr>", { noremap = true } },
	},
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
		desc = "Open Telescope",
		cmd = "<cmd>Telescope<cr>",
		keys = { "n", "<leader>tele", { noremap = true } },
	},
	{
		desc = "Open Telescope Command Center",
		cmd = "<cmd>Telescope commander<cr>",
		keys = { "n", "<leader>t", { noremap = true } },
	},
	{
		desc = "Search inside current buffer",
		cmd = ":lua require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand('%:p') } })<cr>",
		keys = { "n", "<c-F>", { noremap = true } },
	},
	{
		desc = "Search for files (respecting .gitignore)",
		cmd = ":lua require('telescope.builtin').find_files({ file_ignore_patterns = { 'public/*', '*.min.js' } })<cr>",
		keys = { "n", "<c-p>", { noremap = true } },
	},
	{
		desc = "Open buffers list",
		cmd = "<cmd>Telescope buffers<cr>",
		keys = { "n", "<c-b>", { noremap = true } },
	},
	{
		desc = "Search across the whole project (with args)",
		cmd = ":lua require('telescope').extensions.live_grep_args.live_grep_args({ file_ignore_patterns = { 'public/*', '*.min.js' } })<cr>",
		keys = { "n", "<c-s>", { noremap = true } },
	},
	{
		desc = "Search string under cursor on the whole project",
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
-- Transparency is off. Not a thing anymore.
-- local transparent = {
-- 	{
-- 		desc = "Toggle transparent background",
-- 		cmd = ":TransparentToggle<cr>",
-- 	},
-- }
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
	-- Not implemented. See old dotfiles.
	-- {
	-- 	desc = "Choose a window to jump to (vim-choosewin)",
	-- 	cmd = ":ChooseWin<cr>",
	-- },
	-- Leap is not installed.
	-- {
	-- 	desc = "Search pattern and jump to match (leap.nvim)",
	-- 	cmd = ":lua Leap()<cr>",
	-- 	keys = { "n", "<leader>l", { noremap = true } },
	-- },
}

commander.add({
	{
		desc = "Open commander",
		cmd = commander.show,
		keys = { "n", "<leader>cc" },
	},
})
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
