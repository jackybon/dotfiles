require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup()

local U = require("plugins.lsp.utils")

local lsp = require("lspconfig")
local lsp_flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true -- emmet_ls

vim.lsp.set_log_level(vim.lsp.log_levels.DEBUG)

local on_attach = function(client, bufnr)
	U.disable_formatting(client)
	U.on_attach(bufnr)
end

local conf = {
	flags = lsp_flags,
	capabilities = capabilities,
	on_attach = on_attach,
}

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lsp[server_name].setup(conf)
	end,

	--- Lua ---
	["sumneko_lua"] = function()
		lsp.sumneko_lua.setup({
			flags = lsp_flags,
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = {
						enable = true,
						showWord = "Disable",
					},
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
						--[[ virtual_text = false,
						signs = true,
						underline = true,
						update_in_insert = true, ]]
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,

	--- Rust ---
	["rust_analyzer"] = function()
		lsp.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			-- Server-specific settings...
			settings = {
				["rust-analyzer"] = {},
			},
		})
	end,

	--- Emmet ---
	["emmet_ls"] = function()
		lsp.emmet_ls.setup({
			-- on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
			init_options = {
				html = {
					options = {
						-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
						["bem.enabled"] = true,
					},
				},
			},
		})
	end,
})
