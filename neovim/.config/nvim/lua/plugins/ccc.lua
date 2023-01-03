local ccc = require("ccc")
local mapping = ccc.mapping
ccc.setup({
	bar_len = 32,
	-- preserve = true,
	save_on_quit = true,
	alpha_show = "show",
	highlighter = {
		auto_enable = true,
		-- filetypes = { "html", "js", "css", "jsx", "ts", "tsx" },
	},
	recognize = {
		input = true,
		output = true,
	},
	mappings = {
		["<ESC>"] = mapping.quit,
	},
})

------------------------------
----- Highlight Settings -----
------------------------------
local color_bg = "#32302f"
local color_fg = "#EEE3CB"
vim.api.nvim_set_hl(0, "CccFloatNormal", { fg = color_fg, bg = color_bg })
vim.api.nvim_set_hl(0, "CccFloatBorder", { fg = color_bg, bg = color_bg })

vim.keymap.set("n", "<leader>cp", "<CMD>CccPick<CR>")
vim.keymap.set("n", "<leader>cc", "<CMD>CccConvert<CR>")
vim.keymap.set("n", "<leader>ct", "<CMD>CccHighlighterToggle<CR>")
