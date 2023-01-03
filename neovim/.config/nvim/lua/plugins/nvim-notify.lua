require("notify").setup({})
require("telescope").load_extension("notify")
vim.notify = require("notify")
