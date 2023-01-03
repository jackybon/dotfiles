require'FTerm'.setup(
	{
		dimensions	= {
			height = 0.53148,
			width = 0.86,
		},
	}
)

-- Example keybindings
vim.keymap.set('n', '†', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '†', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
