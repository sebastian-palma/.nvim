vim.g.indent_blankline_char = '│'
vim.cmd [[highlight IndentOdd  guifg=#635C57 guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentEven guifg=#403C39 guibg=NONE gui=nocombine]]
vim.g.indent_blankline_char_highlight_list = {"IndentOdd", "IndentEven"}
