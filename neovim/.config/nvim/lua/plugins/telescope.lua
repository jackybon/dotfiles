local actions = require("telescope.actions")
local lactions = require("telescope.actions.layout")
local finders = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},

		----- Better UI -----
		set_env = { { ["COLORTERM"] = "truecolor" } },
		--		border = false,
		--		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		results_title = false,
		prompt_title = false,
		dynamic_preview_title = true,
		prompt_prefix = " ▶ ",
		entry_prefix = "  ",
		selection_caret = "  ",
		multi_icon = "✔",
		winblend = 0,
		color_devicons = true,
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},

		initial_mode = "insert",
		sorting_strategy = "ascending",
		path_diaplay = { "truncate" },
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<TAB>"] = actions.move_selection_next,
				["<S-TAB>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				-- ["<C-s>"] = actions.send_selected_to_qflist,
				-- ["<C-q>"] = actions.send_to_qflist,
				-- ["<C-h>"] = lactions.toggle_preview,
			},
		},
	},
	pickers = {
		find_files = {},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
		},
		bookmarks = {
			selected_browser = "chrome",
			url_open_command = "open",
			full_path = true,
			debug = false,
		},
		-- {
		-- 	file_browser = {
		-- 		theme = "gruvbox",
		-- 		hijack_netrw = true,
		-- 		actions = {
		-- 			mappings = {
		-- 				i = {},
		-- 			},
		-- 		},
		-- 	},
		-- },
		-- {
		-- 	media_files = {
		-- 		filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
		-- 		find_cmd = "rg", -- find command (defaults to `fd`)
		-- 	},
		-- },
		packer = {
			-- theme = "ivy",
			-- layout_config = {
			-- 	height = 0.618,
			-- },
		},
	},
})

local Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			vim.cmd.wincmd("l")
		end
		return finders[k]
	end,
})

---------------------------
----- Keymap Settings -----
---------------------------
-- Ctrl-p = fuzzy finder
vim.keymap.set("n", "<C-P>", function()
	local ok = pcall(Telescope.git_files, { show_untracked = true })
	if not ok then
		Telescope.find_files()
	end
end)

local function sp_folders()
	local paths = { "~/.config/nvim/lua", "~/.tmux.conf" }
	local search_dirs = "{"
	local flag = false
	for _, v in ipairs(paths) do
		if flag then
			search_dirs = search_dirs .. ","
		end
		search_dirs = search_dirs .. "'" .. v .. "'"
		flag = true
	end
	return search_dirs .. "}"
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>FF", "<CMD>Telescope find_files hidden=true<CR>", {})
vim.keymap.set("n", "<leader>fl", "<CMD>Telescope find_files hidden=true search_dirs=" .. sp_folders() .. "<CR>", {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fc", builtin.commands, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- symbols
vim.keymap.set("n", "<leader>fs", ":Telescope symbols<CR>", { noremap = true })

-- file_browser
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { noremap = true })

-- projects
-- vim.keymap.set("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>")

-- xray23 sessions
-- vim.keymap.set("n", "<leader>ft", "<CMD>Telescope xray23 list<CR>")
-- vim.api.nvim_create_user_command("SessionSave", function()
-- 	vim.api.nvim_cmd(vim.api.nvim_parse_cmd("Telescope xray23 save", {}), {})
-- end, { desc = "load user session,like workspace" })

-- packer
vim.keymap.set("n", "<leader>fm", "<CMD>Telescope packer<CR>")

-- session-len
vim.keymap.set("n", "<leader>ss", "<CMD>SearchSession<CR>")

------------------------------
----- Highlight Settings -----
------------------------------
local colors_bg = {
	"#32302f",
	"#3c3836",
}
local colors = {
	prompt_title = "#B7C4CF",
	prompt_title_background = colors_bg[2],
	prompt_background = colors_bg[2],
	results_title = "#EEE3CB",
	results_title_background = colors_bg[1],
	results_background = colors_bg[1],
	preview_title = "#EEE3CB",
	preview_title_background = colors_bg[1],
	preview_background = colors_bg[1],
}

--- Prompt ---
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.prompt_background, bg = colors.prompt_background })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.prompt_background })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.prompt_title, bg = colors.prompt_title_background })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = "#FEC771" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#EB7070" })

----- Results ---
vim.api.nvim_set_hl(0, "TelescopeSelection", { bold = true, fg = "#FF8243", bg = colors_bg[2] })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.results_background, bg = colors.results_background })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = colors.results_background })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.results_title, bg = colors.results_title_background })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#D7C0AE" })

--- Preview ---
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.preview_background, bg = colors.preview_background })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = colors.preview_background })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.preview_title, bg = colors.preview_title_background })
vim.api.nvim_set_hl(0, "TelescopePreviewMessage", { fg = "#FEC771", bg = colors.preview_title_background })
vim.api.nvim_set_hl(
	0,
	"TelescopePreviewMessageFillchar",
	{ fg = colors.preview_title_background, bg = colors.preview_title_background }
)
