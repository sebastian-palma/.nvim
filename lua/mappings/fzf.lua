vim.api.nvim_set_keymap('n', '<LEADER>fbl', ':BLines<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>ffi', ':Files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>fbu', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>frg', ':Rg<CR>', {noremap = true})
vim.api.nvim_exec([[
	" access all files by respecting .gitignore
	let $FZF_DEFAULT_COMMAND = 'rg --files'

	" avoid matching in file names (https://archive.ph/Sf1Ao)
	command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..', 'window': { 'width': 0.99, 'height': 0.99 }}), <bang>0)


	function! RgWrapper(identificator, query, wholeWord)
	        if a:wholeWord == "true" 
			" notice the -w at the end, which is the RG option to use whole words (https://stackoverflow.com/a/54261479/5025116)
			let l:rgCommand = "rg --column --line-number --no-heading --color=always --smart-case -w"
		else
			let l:rgCommand = "rg --column --line-number --no-heading --color=always --smart-case"
		end
		call fzf#vim#grep(printf(printf(" %s '%s'", l:rgCommand, a:identificator), a:query), 1, fzf#vim#with_preview(), 0)
	endfunction

	function! RgNoSpec()
		let command_fmt = 'rg -g "!spec/*" -g "!db/*" --column --line-number --no-heading --color=always --smart-case -- %s || true'
		let reload_command = printf(command_fmt, '{q}')
		let spec = {'options': ['--phony', '--bind', 'change:reload:'.reload_command]}
		call fzf#vim#grep(command_fmt, 1, fzf#vim#with_preview(spec))
	endfunction


	command! -nargs=* -bang FindUnderCursor      call RgWrapper("%s", <q-args>, "false")
	command! -nargs=* -bang FindWholeUnderCursor call RgWrapper("%s", <q-args>, "true")
	command! -nargs=* -bang FindNoSpec           call RgNoSpec()

	nnoremap <Leader>fuc :FindUnderCursor      <C-R><C-W><CR>
	nnoremap <Leader>fwc :FindWholeUnderCursor <C-R><C-W><CR>
	nnoremap <Leader>fns :FindNoSpec           <C-R><C-W><CR>

	let g:fzf_layout = { 'window': { 'width': 0.99, 'height': 0.99 } }
]], true)
