vim.api.nvim_exec([[
	" use <Tab> and <S-Tab> to navigate through popup menu
	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" use <Tab> as trigger keys
	imap <Tab>   <Plug>(completion_smart_tab)
	imap <S-Tab> <Plug>(completion_smart_s_tab)

	" code navigation
	nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
	nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
	nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
	nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

	" code actions
	nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>

	" set updatetime for CursorHold
	" 300ms of no cursor movement to trigger CursorHold
	set updatetime=300

	" show diagnostic popup on cursor hold
	autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

	" goto previous/next diagnostic warning/error
	nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
	nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

	" have a fixed column for the diagnostics to appear in
	" this removes the jitter when warnings/errors flow in
	set signcolumn=yes

	" Enable type inlay hints
	autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
	
	nnoremap n nzzzv
]], true)
