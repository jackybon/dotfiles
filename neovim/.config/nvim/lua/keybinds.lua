local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map("n", "*", "*N")

-- Fix n and N. Keeping cursor in center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Mimic shell movements
map("i", "<C-E>", "<C-o>$")
map("i", "<C-A>", "<C-o>^")

-- Fix Q
map("n", "Q", "<nop>")

-- Resize
map("n", "<Up>", "<CMD>resize -2<CR>")
map("n", "<Down>", "<CMD>resize +2<CR>")
map("n", "<Left>", "<CMD>vertical resize +2<CR>")
map("n", "<Right>", "<CMD>vertical resize -2<CR>")

-- Split
map("n", "<leader>vs", "<CMD>vsplit<CR>")
map("n", "<leader>vx", "<CMD>split<CR>")

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")

map("n", "<leader>z", "<CMD>set invrnu invnu<CR>")

map("n", "<leader>x", "<CMD>edit ~/.config/nvim/init.lua<CR>")
map("n", "<leader>X", "<CMD>source ~/.config/nvim/init.lua<CR><CMD>PackerCompile<CR>")

map("n", "<Tab>", "<CMD>bnext<CR>")
map("n", "<S-Tab>", "<CMD>bNext<CR>")

map("n", "<leader>cd", "<CMD>cd %:h<CR>")
