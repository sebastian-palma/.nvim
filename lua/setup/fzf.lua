vim.api.nvim_exec([[
	" use the file full path relative to the current git project
	" colorscheme ayu_dark
	let g:lightline = {'colorscheme': 'powerlineish', 'component_function': {'filename': 'LightlineFilename',}}

	function! LightlineFilename()
		let root = fnamemodify(get(b:, 'git_dir'), ':h')
	  	let path = expand('%:p')
	  	if path[:len(root)-1] ==# root
	  		return path[len(root)+1:]
	  	endif
	  	return expand('%')
	endfunction
 
	" disable vim ruby provider logic
	let g:loaded_ruby_provider = 0
]], true)
