let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 init.lua
badd +2 ~/.config/nvim/lua/setup/nvim-lspconfig.lua
badd +3 ~/.config/nvim/lua/plugins/cmp-nvim-lsp.lua
badd +1 ~/.config/nvim/lua/setup/general.lua
badd +3 ~/.config/nvim/lua/plugins/nvim-cmp.lua
badd +2 ~/.config/nvim/after/ftplugin/lua.vim
badd +1 ~/.config/nvim/lua/plugins/indent-blankline-nvim.lua
badd +4 ~/.config/nvim/lua/plugins/colorscheme.lua
argglobal
%argdel
edit init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 1resize ' . ((&columns * 108 + 108) / 216)
exe '2resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 2resize ' . ((&columns * 108 + 108) / 216)
exe '3resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 3resize ' . ((&columns * 107 + 108) / 216)
exe '4resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 4resize ' . ((&columns * 107 + 108) / 216)
argglobal
balt ~/.config/nvim/lua/plugins/colorscheme.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 018|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/plugins/colorscheme.lua", ":p")) | buffer ~/.config/nvim/lua/plugins/colorscheme.lua | else | edit ~/.config/nvim/lua/plugins/colorscheme.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/plugins/colorscheme.lua
endif
balt init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 03|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/setup/nvim-lspconfig.lua", ":p")) | buffer ~/.config/nvim/lua/setup/nvim-lspconfig.lua | else | edit ~/.config/nvim/lua/setup/nvim-lspconfig.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/setup/nvim-lspconfig.lua
endif
balt ~/.config/nvim/lua/setup/general.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 40 - ((29 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 40
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/setup/general.lua", ":p")) | buffer ~/.config/nvim/lua/setup/general.lua | else | edit ~/.config/nvim/lua/setup/general.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/setup/general.lua
endif
balt ~/.config/nvim/lua/setup/nvim-lspconfig.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 6 - ((5 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 1resize ' . ((&columns * 108 + 108) / 216)
exe '2resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 2resize ' . ((&columns * 108 + 108) / 216)
exe '3resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 3resize ' . ((&columns * 107 + 108) / 216)
exe '4resize ' . ((&lines * 31 + 32) / 65)
exe 'vert 4resize ' . ((&columns * 107 + 108) / 216)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
