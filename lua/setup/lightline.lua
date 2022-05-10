vim.cmd [[set laststatus=2]]
vim.api.nvim_exec([[
  if !has('gui_running')
    set t_Co=256
  endif
]], true)
vim.api.nvim_exec([[
  " use the file full path relative to the current git project
  " colorscheme ayu_dark
  let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'filename', 'modified', 'SU' ] ],
      \ 'right': [
      \   ['lineinfo'],
      \   ['percent']
      \ ]
    \ },
    \ 'component': {
    \   'SU': '🇺🇦'
    \ },
    \ 'component_function': {
      \ 'filename': 'LightlineFilename',
    \ }
  \ }
]], true)
vim.api.nvim_exec([[
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]], true)
