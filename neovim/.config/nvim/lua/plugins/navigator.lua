require('Navigator').setup({
	auto_save = 'current'
})

vim.keymap.set({'n', 't'}, '˙', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '¬', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '˚', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '∆', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, 'π', '<CMD>NavigatorPrevious<CR>')
