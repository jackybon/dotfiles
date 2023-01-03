require("nvim-tree").setup({
	open_on_setup = false,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 28,
		side = "left",
		mappings = {
			list = {
				{ key = "<C-]>", action = "" },
				{ key = "C", action = "cd" },
				{ key = "-", action = "" },
				{ key = "u", action = "dir_up" },
				{ key = "<C-v>", action = "" },
				{ key = "s", action = "vsplit" },
				{ key = "<C-x>", action = "" },
				{ key = "i", action = "split" },
				{ key = "<C-t>", action = "" },
				{ key = "t", action = "tabnew" },
			},
		},
	},
	filters = {
		custom = { ".git$", "node_modules$", "^target$" },
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			window_picker = {
				-- enable = false,
			},
		},
	},
	renderer = {
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = false,
			},
			glyphs = {
				default = "",
				git = {
					unstaged = "~",
					staged = "+",
					unmerged = "!",
					renamed = "≈",
					untracked = "?",
					deleted = "-",
				},
			},
		},
		indent_markers = {
			enable = true,
		},
	},
})

vim.keymap.set("n", "<leader>l", "<CMD>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>/", "<CMD>NvimTreeFindFile<CR>")

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("NVIM_TREE", { clear = true }),
	pattern = "NvimTree",
	callback = function()
		vim.api.nvim_win_set_option(0, "wrap", false)
	end,
})
