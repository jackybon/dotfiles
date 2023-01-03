local o = vim.o
local g = vim.g

-- Better editor UI
o.background = "dark"
o.cursorline = false

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Better editing experience
o.expandtab = false
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1
o.scrolloff = 8
o.autoindent = true
o.smartindent = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

o.compatible = false
o.history = 50
o.wildmode = "longest,list,full"
o.encoding = "UTF-8"
o.fileencodings = "ucs-bom,utf-8,default,latin1,gb18030"

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Change leader
g.mapleader = " "
g.maplocalleader = " "

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
o.termguicolors = true
