vim.keymap.set("n", ",x", '<CMD>lua require("Buffers").only()<CR>')
vim.keymap.set("n", ",X", '<CMD>lua require("Buffers").clear()<CR>')
vim.keymap.set("n", ",q", '<CMD>lua require("Buffers").delete()<CR>')
