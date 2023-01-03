-- Treesitter folds
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevelstart = 99

require("nvim-treesitter.configs").setup({
	-- nvim-treesitter/nvim-treesitter (self config)
	auto_install = true,
	ensure_installed = {
		"c",
		"lua",
		"rust",
		"go",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"markdown_inline",
		"html",
		"css",
		"json",
		"bash",
	},
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			-- NOTE: These are visual mode mappings
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<Tab>",
		},
	},
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
})
