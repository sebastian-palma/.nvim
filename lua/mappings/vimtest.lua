vim.api.nvim_set_keymap('n', '<LEADER>vtf', ':TestFile<CR>',    {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>vtl', ':TestLast<CR>',    {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>vtn', ':TestNearest<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<LEADER>vts', ':TestSuite<CR>',   {noremap = true})


-- 
-- Add mappings to execute RSpec tests based on:
--   - the directory
--   - the file
--   - the file plus the line number
--   - the last tested file
--
-- It writes the last file tested to a /tmp file
-- in order to know which file was when using the
-- ExecuteBinRspecLastTestedFile() command.
--
vim.api.nvim_exec([[
	" UTILS
	function! GetCurrentDirectory()
		return resolve(expand('%:p:h')) . "/"
	endfunction

	function! GetTmpDirectory()
		return "/tmp/test-biegacz" . GetCurrentDirectory()
	endfunction

	function! GetTmpFileName()
		return GetTmpDirectory() . "tmp.txt"
	endfunction

	function! SilentExecuteTmux(command)
		let l:tmux_session_window = "vtr.0"
		silent! execute "!tmux send-keys -t " . tmux_session_window . " '" . a:command . "' ENTER"
	endfunction

	function! SendToTmux() range
		let [lnum1, col1] = getpos("'<")[1:2]
		let [lnum2, col2] = getpos("'>")[1:2]
		let lines = getline(lnum1, lnum2)         
		let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
		let lines[0] = lines[0][col1 - 1:]
		let selectedText = join(lines, "\n")
		let f = substitute(selectedText, "\n", " ", "g")

		call SilentExecuteTmux(f)
	endfunction

	function! CreateTmpDirectory()
		silent! execute "!mkdir -p " . GetTmpDirectory()
	endfunction

	function! CreateTmpFile()
		silent! execute "!touch " . GetTmpFileName()
	endfunction

	function! SaveLastFileTested(last_file_tested)
		silent! execute "call writefile(['" . a:last_file_tested . "'], GetTmpFileName())"
	endfunction

	function! TestCmd()
		"return "bundle exec rails test "
		return "bundle exec rspec -fp "
	endfunction
	" UTILS



	function! ExecuteBinRspecDirectory()
		let l:command = TestCmd() . GetCurrentDirectory()

		call CreateTmpDirectory()
		call CreateTmpFile()
		call SaveLastFileTested(GetCurrentDirectory())
		call SilentExecuteTmux(command)
	endfunction

	function! ExecuteBinRspecFile()
		let l:last_file_tested = resolve(expand('%:p'))
		let l:command = TestCmd() . last_file_tested

		call CreateTmpDirectory()
		call CreateTmpFile()
		call SaveLastFileTested(last_file_tested)
		call SilentExecuteTmux(command)
	endfunction

	function! ExecuteBinRspecNearest()
		let l:last_file_tested = resolve(expand('%:p')) . ":" . line(".")
		let l:command = TestCmd() . last_file_tested

		call CreateTmpDirectory()
		call CreateTmpFile()
		call SilentExecuteTmux(command)
	endfunction

	function! ExecuteBinRspecLastTestedFile()
		for last_tested_file in readfile(GetTmpFileName(), '', 1)
			let l:command = TestCmd() . last_tested_file
			call SilentExecuteTmux(command)
		endfor
	endfunction



	nnoremap <Leader>etd :call ExecuteBinRspecDirectory()      <CR>
	nnoremap <Leader>etf :call ExecuteBinRspecFile()           <CR>
	nnoremap <Leader>etl :call ExecuteBinRspecLastTestedFile() <CR>
	nnoremap <Leader>etn :call ExecuteBinRspecNearest()        <CR>

	command! -range MainSendToTmux call SendToTmux()
	vnoremap <Leader>stt :<C-U>MainSendToTmux<CR>
]], true)
