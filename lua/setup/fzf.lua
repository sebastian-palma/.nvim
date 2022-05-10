vim.api.nvim_exec([[
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
