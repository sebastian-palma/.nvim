vim.api.nvim_exec([[
	augroup remember_folds
		autocmd!
		autocmd BufWinLeave * mkview
		autocmd BufWinEnter * silent! loadview
	augroup END
]], true)
