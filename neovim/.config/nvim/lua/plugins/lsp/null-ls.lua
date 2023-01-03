local nls = require("null-ls")
local U = require("plugins.lsp.utils")

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

-- Configuring null-ls
nls.setup({
	sources = {
		----------------
		-- FORMATTING --
		----------------
		fmt.trim_whitespace.with({
			filetypes = { "text", "zsh", "toml", "make", "conf", "tmux" },
		}),
		-- NOTE:
		-- 1. both needs to be enabled to so prettier can apply eslint fixes
		-- 2. prettierd should come first to prevent occassional race condition
		fmt.gofumpt,
		fmt.prettierd,
		fmt.rustfmt,
		fmt.shfmt.with({
			extra_args = { "-i", 4, "-ci", "-sr" },
		}),
		fmt.stylua,
		fmt.yamlfmt,
		-----------------
		-- DIAGNOSTICS --
		-----------------
		--[[ dgn.shellcheck,
		dgn.eslint_d, ]]
		--[[ dgn.luacheck.with({
			extra_args = { "--globals", "vim", "--std", "luajit" },
		}), ]]
		--[[ dgn.jsonlint,
		dgn.markdownlint, ]]
		------------------
		-- CODE ACTIONS --
		------------------
		--[[ cda.shellcheck,
		cda.eslint_d,
		dgn.jsonlint,
		dgn.markdownlint, ]]
	},
	on_attach = function(client, bufnr)
		U.fmt_on_save(client, bufnr)
		U.on_attach(bufnr)
	end,
})
