require("lualine").setup({
	options = {
		theme = "gruvbox",
		icons_enabled = true,
		globalstatus = false,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				color = { gui = "bold" },
			},
		},
		lualine_b = {
			{ "branch" },
			{ "diff", colored = false },
			{ "diagnostics" },
		},
		lualine_c = {
			{ "filename", file_status = true },
			{ "diagnostics" },
		},
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress", "filesize" },
		lualine_z = {
			{
				"location",
				color = { gui = "bold" },
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{ "buffers", buffers_color = { active = "lualine_b_normal" } },
		},
		lualine_y = {
			{ "tabs", tabs_color = { active = "lualine_b_normal" } },
		},
		lualine_z = {
			{ require("auto-session-library").current_session_name },
		},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = { "quickfix", "nvim-tree" },
})
