require('hop').setup({
	quit_key = '<SPC>',
})

vim.keymap.set('n', '<leader>j', '<CMD>HopWordAC<CR>')
vim.keymap.set('n', '<leader>k', '<CMD>HopWordBC<CR>')
