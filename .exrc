let s:cpo_save=&cpo
set cpo&vim
inoremap <C-G>S <Plug>(nvim-surround-insert-line)
inoremap <C-G>s <Plug>(nvim-surround-insert)
cnoremap <expr> <Down> wilder#can_accept_completion()  ?  wilder#accept_completion()  :  '<Down>'
cnoremap <expr> <Up> wilder#can_reject_completion()  ?  wilder#reject_completion()  :  '<Up>'
cnoremap <expr> <S-Tab> wilder#in_context()  ?  wilder#previous()  :  '<S-Tab>'
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <expr> <Plug>(sexp_insert_backspace) sexp#backspace_insertion()
inoremap <silent> <expr> <Plug>(sexp_insert_double_quote) sexp#quote_insertion('"')
inoremap <silent> <expr> <Plug>(sexp_insert_closing_curly) sexp#closing_insertion('}')
inoremap <silent> <expr> <Plug>(sexp_insert_closing_square) sexp#closing_insertion(']')
inoremap <silent> <expr> <Plug>(sexp_insert_closing_round) sexp#closing_insertion(')')
inoremap <silent> <expr> <Plug>(sexp_insert_opening_curly) sexp#opening_insertion('{')
inoremap <silent> <expr> <Plug>(sexp_insert_opening_square) sexp#opening_insertion('[')
inoremap <silent> <expr> <Plug>(sexp_insert_opening_round) sexp#opening_insertion('(')
inoremap <C-U> u
vnoremap  <Cmd>call smoothie#do("\<C-B>") 
nnoremap  :lua require('telescope.builtin').buffers({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } } })
vnoremap  <Cmd>call smoothie#do("\<C-D>") 
nnoremap  <Cmd>call smoothie#do("\<C-D>") 
vnoremap  <Cmd>call smoothie#do("\<C-F>") 
nnoremap  :lua require('telescope.builtin').live_grep({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } }, search_dirs = { vim.fn.expand('%:p') } })
nnoremap  :lua TelescopeGrepWithHighlight()
nnoremap  h
nnoremap <NL> j
nnoremap  k
nnoremap  l
nnoremap  :lua require('telescope.builtin').find_files({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } }, file_ignore_patterns = { '*.min.js' } })
nnoremap  :lua require('telescope').extensions.live_grep_args.live_grep_args({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } }, file_ignore_patterns = { '*.min.js' } })
vnoremap  <Cmd>call smoothie#do("\<C-U>") 
nnoremap  <Cmd>call smoothie#do("\<C-U>") 
nmap m <Plug>(zoom-toggle)
nmap  d
tnoremap <silent>  
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap * *``
nnoremap ,trl :lua require('trouble').last({skip_groups = true, jump = true})
nnoremap ,trf :lua require('trouble').first({skip_groups = true, jump = true})
nnoremap ,trp :lua require('trouble').previous({skip_groups = true, jump = true})
nnoremap ,trn :lua require('trouble').next({skip_groups = true, jump = true})
nnoremap ,trd <Cmd>TroubleToggle document_diagnostics
nnoremap ,trw <Cmd>TroubleToggle workspace_diagnostics
nnoremap ,det :lua vim.diagnostic.enable(true)
nnoremap ,def :lua vim.diagnostic.enable(false)
nnoremap ,tele <Cmd>Telescope
nnoremap ,rr :RustRunnables
nnoremap ,rh :RustHoverAction
nnoremap ,re :lua vim.lsp.buf.hover()
nnoremap ,rc :lua vim.lsp.buf.code_action()
nnoremap ,rb :lua vim.lsp.buf.rename()
nnoremap ,ra :lua vim.lsp.buf.references()
nnoremap , :SymbolsOutline
nnoremap ,gts <Cmd>Lspsaga goto_definition
nnoremap ,gtv :split | lua vim.lsp.buf.definition()
nnoremap ,ntff :NvimTreeFindFile
nnoremap ,  :NvimTreeToggle
nnoremap <silent> ,, :w
nnoremap ,o <Cmd>Outline
xnoremap <silent> <expr> @ mode() ==# 'V' ? ':normal! @'.getcharstr().'' : '@'
nnoremap J gJi diw
xnoremap <silent> <expr> Q mode() ==# 'V' ? ':normal! @=reg_recorded()' : 'Q'
xnoremap S <Plug>(nvim-surround-visual)
vnoremap Y :OSCYankVisual
nnoremap Y :OSCYankVisual
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap cS <Plug>(nvim-surround-change-line)
nnoremap cs <Plug>(nvim-surround-change)
nnoremap ds <Plug>(nvim-surround-delete)
xnoremap gS <Plug>(nvim-surround-visual-line)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gc <Plug>(comment_toggle_linewise)
nnoremap ySS <Plug>(nvim-surround-normal-cur-line)
nnoremap yS <Plug>(nvim-surround-normal-line)
nnoremap yss <Plug>(nvim-surround-normal-cur)
nnoremap ys <Plug>(nvim-surround-normal)
vnoremap zb <Cmd>call smoothie#do("zb") 
nnoremap zb <Cmd>call smoothie#do("zb") 
vnoremap z- <Cmd>call smoothie#do("z-") 
nnoremap z- <Cmd>call smoothie#do("z-") 
vnoremap zz <Cmd>call smoothie#do("zz") 
nnoremap zz <Cmd>call smoothie#do("zz") 
vnoremap z. <Cmd>call smoothie#do("z.") 
nnoremap z. <Cmd>call smoothie#do("z.") 
vnoremap z <Cmd>call smoothie#do("z\<CR>") 
nnoremap z <Cmd>call smoothie#do("z\<CR>") 
vnoremap zt <Cmd>call smoothie#do("zt") 
nnoremap zt <Cmd>call smoothie#do("zt") 
vnoremap z^ <Cmd>call smoothie#do("z^") 
nnoremap z^ <Cmd>call smoothie#do("z^") 
vnoremap z+ <Cmd>call smoothie#do("z+") 
nnoremap z+ <Cmd>call smoothie#do("z+") 
nnoremap <C-G> :lua TelescopeGrepWithHighlight()
nnoremap <C-S> :lua require('telescope').extensions.live_grep_args.live_grep_args({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } }, file_ignore_patterns = { '*.min.js' } })
nnoremap <C-P> :lua require('telescope.builtin').find_files({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } }, file_ignore_patterns = { '*.min.js' } })
nnoremap <C-Right> l
nnoremap <C-Up> k
nnoremap <C-Down> j
nnoremap <C-Left> h
nnoremap <C-K> k
nnoremap <C-J> j
nnoremap <C-H> h
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
vnoremap <Plug>OSCYankVisual :OSCYankVisual
nnoremap <expr> <Plug>OSCYankOperator OSCYankOperator()
nmap <C-W>m <Plug>(zoom-toggle)
nnoremap <silent> <Plug>(zoom-toggle) :call zoom#toggle()
noremap <silent> <Plug>(SmoothieBackwards) <Cmd>call smoothie#backwards() 
noremap <silent> <Plug>(SmoothieForwards) <Cmd>call smoothie#forwards()  
noremap <silent> <Plug>(SmoothieUpwards) <Cmd>call smoothie#upwards()   
noremap <silent> <Plug>(SmoothieDownwards) <Cmd>call smoothie#downwards() 
vnoremap <PageUp> <Cmd>call smoothie#do("\<PageUp>") 
nnoremap <PageUp> <Cmd>call smoothie#do("\<PageUp>") 
vnoremap <S-Up> <Cmd>call smoothie#do("\<S-Up>") 
nnoremap <S-Up> <Cmd>call smoothie#do("\<S-Up>") 
vnoremap <C-B> <Cmd>call smoothie#do("\<C-B>") 
nnoremap <C-B> :lua require('telescope.builtin').buffers({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } } })
vnoremap <PageDown> <Cmd>call smoothie#do("\<PageDown>") 
nnoremap <PageDown> <Cmd>call smoothie#do("\<PageDown>") 
vnoremap <S-Down> <Cmd>call smoothie#do("\<S-Down>") 
nnoremap <S-Down> <Cmd>call smoothie#do("\<S-Down>") 
vnoremap <C-F> <Cmd>call smoothie#do("\<C-F>") 
nnoremap <C-F> :lua require('telescope.builtin').live_grep({ layout_strategy = 'vertical', layout_config = { vertical = { prompt_position = 'top', mirror = true } }, search_dirs = { vim.fn.expand('%:p') } })
vnoremap <C-U> <Cmd>call smoothie#do("\<C-U>") 
nnoremap <C-U> <Cmd>call smoothie#do("\<C-U>") 
vnoremap <C-D> <Cmd>call smoothie#do("\<C-D>") 
nnoremap <C-D> <Cmd>call smoothie#do("\<C-D>") 
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
onoremap <silent> <Plug>(leap-cross-window) <Plug>(leap-from-window)
xnoremap <silent> <Plug>(leap-cross-window) <Plug>(leap-from-window)
nnoremap <silent> <Plug>(leap-cross-window) <Plug>(leap-from-window)
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
xnoremap <silent> <Plug>(sexp_capture_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 1, 1)
nnoremap <silent> <Plug>(sexp_capture_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'n', 1, 1)
xnoremap <silent> <Plug>(sexp_capture_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 0, 1)
nnoremap <silent> <Plug>(sexp_capture_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'n', 0, 1)
xnoremap <silent> <Plug>(sexp_emit_tail_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 1, 0)
nnoremap <silent> <Plug>(sexp_emit_tail_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'n', 1, 0)
xnoremap <silent> <Plug>(sexp_emit_head_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'v', 0, 0)
nnoremap <silent> <Plug>(sexp_emit_head_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#stackop', 'n', 0, 0)
xnoremap <silent> <Plug>(sexp_swap_element_forward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 1, 0)
nnoremap <silent> <Plug>(sexp_swap_element_forward) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#swap_element', 'n', 1, 0)
xnoremap <silent> <Plug>(sexp_swap_element_backward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 0, 0)
nnoremap <silent> <Plug>(sexp_swap_element_backward) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#swap_element', 'n', 0, 0)
xnoremap <silent> <Plug>(sexp_swap_list_forward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 1, 1)
nnoremap <silent> <Plug>(sexp_swap_list_forward) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#swap_element', 'n', 1, 1)
xnoremap <silent> <Plug>(sexp_swap_list_backward) :call sexp#docount(v:prevcount, 'sexp#swap_element', 'v', 0, 1)
nnoremap <silent> <Plug>(sexp_swap_list_backward) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#swap_element', 'n', 0, 1)
nnoremap <silent> <Plug>(sexp_splice_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#splice_list(b:sexp_count)
nnoremap <silent> <Plug>(sexp_convolute) :let b:sexp_count = v:count | call sexp#convolute(b:sexp_count, 'n')
xnoremap <silent> <Plug>(sexp_raise_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#raise', 'v', '')
nnoremap <silent> <Plug>(sexp_raise_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#raise', 'n', 'sexp#select_current_element', 'n', 1)
xnoremap <silent> <Plug>(sexp_raise_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#raise', 'v', '')
nnoremap <silent> <Plug>(sexp_raise_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#raise', 'n', 'sexp#select_current_list', 'n', 0, 0)
nnoremap <silent> <Plug>(sexp_insert_at_list_tail) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#insert_at_list_terminal(1)
nnoremap <silent> <Plug>(sexp_insert_at_list_head) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#insert_at_list_terminal(0)
xnoremap <silent> <Plug>(sexp_curly_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 1, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_curly_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('e', '{', '}', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_curly_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_curly_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('e', '{', '}', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 1, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_square_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('e', '[', ']', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_square_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('e', '[', ']', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 1, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_round_tail_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('e', '(', ')', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_round_head_wrap_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('e', '(', ')', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_curly_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 1, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_curly_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('f', '{', '}', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_curly_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '{', '}', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_curly_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('f', '{', '}', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 1, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_square_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('f', '[', ']', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_square_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '[', ']', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_square_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('f', '[', ']', 0, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 1, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_round_tail_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('f', '(', ')', 1, g:sexp_insert_after_wrap)
xnoremap <silent> <Plug>(sexp_round_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('v', '(', ')', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_round_head_wrap_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#wrap('f', '(', ')', 0, g:sexp_insert_after_wrap)
nnoremap <silent> <Plug>(sexp_indent_top) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#indent(1, b:sexp_count)
nnoremap <silent> <Plug>(sexp_indent) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#indent(0, b:sexp_count)
onoremap <silent> <Plug>(sexp_select_next_element) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'o', 1)
xnoremap <silent> <Plug>(sexp_select_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'v', 1)
nnoremap <silent> <Plug>(sexp_select_next_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'n', 1)
onoremap <silent> <Plug>(sexp_select_prev_element) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'o', 0)
xnoremap <silent> <Plug>(sexp_select_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'v', 0)
nnoremap <silent> <Plug>(sexp_select_prev_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_adjacent_element', 'n', 0)
onoremap <silent> <Plug>(sexp_move_to_next_top_element) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#move_to_adjacent_element('o', b:sexp_count, 1, 0, 1)
xnoremap <silent> <Plug>(sexp_move_to_next_top_element) :call sexp#move_to_adjacent_element('v', v:prevcount, 1, 0, 1)
nnoremap <silent> <Plug>(sexp_move_to_next_top_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#move_to_adjacent_element('n', b:sexp_count, 1, 0, 1)
onoremap <silent> <Plug>(sexp_move_to_prev_top_element) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#move_to_adjacent_element('o', b:sexp_count, 0, 0, 1)
xnoremap <silent> <Plug>(sexp_move_to_prev_top_element) :call sexp#move_to_adjacent_element('v', v:prevcount, 0, 0, 1)
nnoremap <silent> <Plug>(sexp_move_to_prev_top_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#move_to_adjacent_element('n', b:sexp_count, 0, 0, 1)
xnoremap <silent> <Plug>(sexp_flow_to_next_leaf_tail) :call sexp#leaf_flow('v', v:prevcount, 1, 1)
nnoremap <silent> <Plug>(sexp_flow_to_next_leaf_tail) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 1, 1)
xnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_tail) :call sexp#leaf_flow('v', v:prevcount, 0, 1)
nnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_tail) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 0, 1)
xnoremap <silent> <Plug>(sexp_flow_to_next_leaf_head) :call sexp#leaf_flow('v', v:prevcount, 1, 0)
nnoremap <silent> <Plug>(sexp_flow_to_next_leaf_head) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 1, 0)
xnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_head) :call sexp#leaf_flow('v', v:prevcount, 0, 0)
nnoremap <silent> <Plug>(sexp_flow_to_prev_leaf_head) :let b:sexp_count = v:count | call sexp#leaf_flow('n', b:sexp_count, 0, 0)
xnoremap <silent> <Plug>(sexp_flow_to_next_close) :call sexp#list_flow('v', v:prevcount, 1, 1)
nnoremap <silent> <Plug>(sexp_flow_to_next_close) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 1, 1)
xnoremap <silent> <Plug>(sexp_flow_to_next_open) :call sexp#list_flow('v', v:prevcount, 1, 0)
nnoremap <silent> <Plug>(sexp_flow_to_next_open) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 1, 0)
xnoremap <silent> <Plug>(sexp_flow_to_prev_open) :call sexp#list_flow('v', v:prevcount, 0, 0)
nnoremap <silent> <Plug>(sexp_flow_to_prev_open) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 0, 0)
xnoremap <silent> <Plug>(sexp_flow_to_prev_close) :call sexp#list_flow('v', v:prevcount, 0, 1)
nnoremap <silent> <Plug>(sexp_flow_to_prev_close) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#list_flow('n', b:sexp_count, 0, 1)
onoremap <silent> <Plug>(sexp_move_to_next_element_tail) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('o', b:sexp_count, 1, 1, 0)
xnoremap <silent> <Plug>(sexp_move_to_next_element_tail) :call sexp#move_to_adjacent_element('v', v:prevcount, 1, 1, 0)
nnoremap <silent> <Plug>(sexp_move_to_next_element_tail) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 1, 1, 0)
onoremap <silent> <Plug>(sexp_move_to_prev_element_tail) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('o', b:sexp_count, 0, 1, 0)
xnoremap <silent> <Plug>(sexp_move_to_prev_element_tail) :call sexp#move_to_adjacent_element('v', v:prevcount, 0, 1, 0)
nnoremap <silent> <Plug>(sexp_move_to_prev_element_tail) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 0, 1, 0)
onoremap <silent> <Plug>(sexp_move_to_next_element_head) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('o', b:sexp_count, 1, 0, 0)
xnoremap <silent> <Plug>(sexp_move_to_next_element_head) :call sexp#move_to_adjacent_element('v', v:prevcount, 1, 0, 0)
nnoremap <silent> <Plug>(sexp_move_to_next_element_head) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 1, 0, 0)
onoremap <silent> <Plug>(sexp_move_to_prev_element_head) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('o', b:sexp_count, 0, 0, 0)
xnoremap <silent> <Plug>(sexp_move_to_prev_element_head) :call sexp#move_to_adjacent_element('v', v:prevcount, 0, 0, 0)
nnoremap <silent> <Plug>(sexp_move_to_prev_element_head) :let b:sexp_count = v:count | call sexp#move_to_adjacent_element('n', b:sexp_count, 0, 0, 0)
onoremap <silent> <Plug>(sexp_move_to_next_bracket) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#move_to_nearest_bracket('o', 1)
xnoremap <silent> <Plug>(sexp_move_to_next_bracket) :call sexp#docount(v:prevcount, 'sexp#move_to_nearest_bracket', 'v', 1)
nnoremap <silent> <Plug>(sexp_move_to_next_bracket) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#move_to_nearest_bracket', 'n', 1)
onoremap <silent> <Plug>(sexp_move_to_prev_bracket) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#move_to_nearest_bracket('o', 0)
xnoremap <silent> <Plug>(sexp_move_to_prev_bracket) :call sexp#docount(v:prevcount, 'sexp#move_to_nearest_bracket', 'v', 0)
nnoremap <silent> <Plug>(sexp_move_to_prev_bracket) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#move_to_nearest_bracket', 'n', 0)
onoremap <silent> <Plug>(sexp_inner_element) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#select_current_element('o', 1)
xnoremap <silent> <Plug>(sexp_inner_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_element('v', 1)
onoremap <silent> <Plug>(sexp_outer_element) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#select_current_element('o', 0)
xnoremap <silent> <Plug>(sexp_outer_element) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_element('v', 0)
onoremap <silent> <Plug>(sexp_inner_string) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#select_current_string('o', 1)
xnoremap <silent> <Plug>(sexp_inner_string) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_string('v', 1)
onoremap <silent> <Plug>(sexp_outer_string) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#select_current_string('o', 0)
xnoremap <silent> <Plug>(sexp_outer_string) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_string('v', 0)
onoremap <silent> <Plug>(sexp_inner_top_list) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#select_current_top_list('o', 1)
xnoremap <silent> <Plug>(sexp_inner_top_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_top_list('v', 1)
onoremap <silent> <Plug>(sexp_outer_top_list) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#select_current_top_list('o', 0)
xnoremap <silent> <Plug>(sexp_outer_top_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#select_current_top_list('v', 0)
onoremap <silent> <Plug>(sexp_inner_list) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#docount(b:sexp_count, 'sexp#select_current_list', 'o', 1, 1)
xnoremap <silent> <Plug>(sexp_inner_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_current_list', 'v', 1, 1)
onoremap <silent> <Plug>(sexp_outer_list) :let b:sexp_count = v:count | execute "normal! vvm`" | call sexp#docount(b:sexp_count, 'sexp#select_current_list', 'o', 0, 1)
xnoremap <silent> <Plug>(sexp_outer_list) :let b:sexp_count = v:count | execute "normal! m`" | call sexp#docount(b:sexp_count, 'sexp#select_current_list', 'v', 0, 1)
snoremap <expr> <BS> ("\<BS>" . (&virtualedit ==# '' && getcurpos()[2] >= col('$') - 1 ? 'a' : 'i'))
nmap <C-W><C-D> d
nnoremap <C-L> l
inoremap S <Plug>(nvim-surround-insert-line)
inoremap s <Plug>(nvim-surround-insert)
cnoremap <expr> 	 wilder#in_context()  ?  wilder#next()  :  '	'
inoremap  u
inoremap <silent> ,, :w
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamed
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -uu\ 
set helplang=en
set noloadplugins
set packpath=/opt/homebrew/Cellar/neovim/0.10.3/share/nvim/runtime
set runtimepath=~/.config/nvim,~/.local/share/nvim/site,~/.local/share/nvim/lazy/lazy.nvim,~/.local/share/nvim/lazy/conform.nvim,~/.local/share/nvim/lazy/nvim-lint,~/.local/share/nvim/lazy/nvim-surround,~/.local/share/nvim/lazy/which-key.nvim,~/.local/share/nvim/lazy/lspkind.nvim,~/.local/share/nvim/lazy/friendly-snippets,~/.local/share/nvim/lazy/cmp_luasnip,~/.local/share/nvim/lazy/LuaSnip,~/.local/share/nvim/lazy/cmp-path,~/.local/share/nvim/lazy/cmp-buffer,~/.local/share/nvim/lazy/nvim-cmp,~/.local/share/nvim/lazy/commander.nvim,~/.local/share/nvim/lazy/nvim-hlslens,~/.local/share/nvim/lazy/vim-oscyank,~/.local/share/nvim/lazy/vim-zoom,~/.local/share/nvim/lazy/lsp-toggle.nvim,~/.local/share/nvim/lazy/vim-dispatch-neovim,~/.local/share/nvim/lazy/vim-dispatch,~/.local/share/nvim/lazy/vim-jack-in,~/.local/share/nvim/lazy/wilder.nvim,~/.local/share/nvim/lazy/vim-smoothie,~/.local/share/nvim/lazy/Comment.nvim,~/.local/share/nvim/lazy/vim-easy-align,~/.local/share/nvim/lazy/vim-illuminate,~/.local/share/nvim/lazy/indent-blankline.nvim,~/.local/share/nvim/lazy/nfnl,~/.local/share/nvim/lazy/nvim-jdtls,~/.local/share/nvim/lazy/badwolf,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/lspsaga.nvim,~/code/neovim/ev,~/.local/share/nvim/lazy/nvim-lsp-file-operations,~/.local/share/nvim/lazy/cmp-nvim-lsp,~/.local/share/nvim/lazy/nvim-lspconfig,~/.local/share/nvim/lazy/mason-tool-installer.nvim,~/.local/share/nvim/lazy/mason-lspconfig.nvim,~/.local/share/nvim/lazy/mason.nvim,~/.local/share/nvim/lazy/conjure,~/.local/share/nvim/lazy/outline.nvim,~/.local/share/nvim/lazy/autoclose.nvim,~/.local/share/nvim/lazy/nvim-tree.lua,~/.local/share/nvim/lazy/leap.nvim,~/.local/share/nvim/lazy/telescope-live-grep-args.nvim,~/.local/share/nvim/lazy/plenary.nvim,~/.local/share/nvim/lazy/telescope.nvim,~/.local/share/nvim/lazy/sqlite.lua,~/.local/share/nvim/lazy/nvim-neoclip.lua,~/.local/share/nvim/lazy/vim-sexp,~/.local/share/nvim/lazy/vim-vsnip-integ,~/.local/share/nvim/lazy/vim-vsnip,~/.local/share/nvim/lazy/rainbow-delimiters.nvim,~/.local/share/nvim/lazy/gitsigns.nvim,~/.local/share/nvim/lazy/vim-fennel-syntax,~/.local/share/nvim/lazy/nvim-web-devicons,~/.local/share/nvim/lazy/trouble.nvim,/opt/homebrew/Cellar/neovim/0.10.3/share/nvim/runtime,/opt/homebrew/Cellar/neovim/0.10.3/share/nvim/runtime/pack/dist/opt/matchit,/opt/homebrew/Cellar/neovim/0.10.3/lib/nvim,~/.local/share/nvim/lazy/cmp_luasnip/after,~/.local/share/nvim/lazy/cmp-path/after,~/.local/share/nvim/lazy/cmp-buffer/after,~/.local/share/nvim/lazy/indent-blankline.nvim/after,~/.local/share/nvim/lazy/cmp-nvim-lsp/after,~/.local/share/nvim/lazy/vim-vsnip-integ/after,~/.config/nvim/after,~/.local/state/nvim/lazy/readme
set splitbelow
set splitright
set undofile
set wildcharm=<Tab>
set window=52
" vim: set ft=vim :
