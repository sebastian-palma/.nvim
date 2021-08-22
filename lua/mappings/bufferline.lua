vim.api.nvim_exec([[
	nnoremap <silent>gt :BufferLineCycleNext<CR>
	nnoremap <silent>gT :BufferLineCyclePrev<CR>
]], true)
