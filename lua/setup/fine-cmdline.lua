require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ' λ '
  },
  popup = {
    position = {
      row = '50%',
      col = '50%',
    },
    size = {
      width = '50%',
    },
    border = {
      style = 'single',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
