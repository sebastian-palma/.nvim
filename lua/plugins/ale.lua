return {
  "dense-analysis/ale",
  lazy = false,
  config = function()
    vim.cmd [[
      let g:ale_fixers = {'python': ['black', 'ruff']}
      let g:ale_python_black_options = '--line-length 100'
      let g:ale_python_pylint_options = '--rcfile pyproject.toml'
      let g:ale_fix_on_save = 1
      let g:ale_floating_preview = 1
      let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
      let g:ale_disable_lsp = 1
      let g:ale_use_neovim_diagnostics_api = 1
      let g:ale_linters = {
      \ 'ruby': ['brakeman', 'rails_best_practices', 'rubocop'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'python': ['ruff']
      \ }
      let g:ale_fixers = {
      \   'css': ['prettier'],
      \   'javascript': ['prettier'],
      \   'ruby': ['rubocop'],
      \ }
      let g:ale_fix_on_save = 1
      let g:ale_linters_explicit = 1
    ]]
  end,
}
