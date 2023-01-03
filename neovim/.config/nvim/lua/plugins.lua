-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile>",
})

return require("packer").startup({
	function(use)
		----- Package Manager -----
		use("wbthomason/packer.nvim")

		----- Required plugins -----
		use("nvim-lua/plenary.nvim")

		----- Theme, Icons, Statubar, Bufferbar -----
		use({
			"ellisonleao/gruvbox.nvim",
			config = function()
				require("plugins.gruvbox")
			end,
		})

		use({
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup()
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
			config = function()
				require("plugins.lualine")
			end,
			options = { theme = "gruvbox" },
		})

		----- Treesitter: Better Highlights -----
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				event = "CursorHold",
				run = ":TSUpdate",
				config = function()
					require("plugins.treesitter")
				end,
			},
			{ "nvim-treesitter/playground", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{
				"windwp/nvim-ts-autotag",
				after = "nvim-treesitter",
				config = function()
					require("nvim-ts-autotag").setup()
				end,
			},
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
		})

		----- Editor UI -----
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("plugins.indentline")
			end,
		})

		-- use({
		-- 	"norcalli/nvim-colorizer.lua",
		-- 	event = "CursorHold",
		-- 	config = function()
		-- 		require("colorizer").setup()
		-- 	end,
		-- })
		use({
			"uga-rosa/ccc.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.ccc")
			end,
		})

		----- Navigation and Fuzzy Search -----
		use({
			"nvim-tree/nvim-tree.lua",
			event = "CursorHold",
			requires = {
				"nvim-tree/nvim-web-devicons",
			},
			config = {
				function()
					require("plugins.nvim-tree")
				end,
			},
		})

		use({
			{
				"nvim-telescope/telescope.nvim",
				requires = { { "nvim-lua/plenary.nvim" } },
				event = "CursorHold",
				config = function()
					require("plugins.telescope")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				after = "telescope.nvim",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-symbols.nvim",
				after = "telescope.nvim",
			},
			-- {
			-- 	"nvim-telescope/telescope-project.nvim",
			-- 	after = "telescope.nvim",
			-- 	config = function()
			-- 		require("telescope").load_extension("project")
			-- 	end,
			-- },
			{
				"nvim-telescope/telescope-file-browser.nvim",
				after = "telescope.nvim",
				config = function()
					require("telescope").load_extension("file_browser")
				end,
			},
			-- {
			-- 	"nvim-telescope/telescope-media-files.nvim",
			-- 	after = "telescope.nvim",
			-- 	config = function()
			-- 		require("telescope").load_extension("media_files")
			-- 	end,
			-- },
			use({
				"dhruvmanila/telescope-bookmarks.nvim",
				after = "telescope.nvim",
				config = function()
					require("telescope").load_extension("bookmarks")
				end,
			}),
			use({
				"nvim-telescope/telescope-packer.nvim",
				after = "telescope.nvim",
				config = function()
					require("telescope").load_extension("packer")
				end,
			}),
			-- use({
			-- 	"HUAHUAI23/telescope-session.nvim",
			-- 	after = "telescope.nvim",
			-- 	config = function()
			-- 		require("telescope").load_extension("xray23")
			-- 	end,
			-- }),
			-- use({
			-- 	"AckslD/nvim-neoclip.lua",
			-- 	after = "telescope.nvim",
			-- 	requires = {
			-- 		{ "kkharji/sqlite.lua", module = "sqlite" },
			-- 	},
			-- 	config = function()
			-- 		require("plugins.neoclip")
			-- 	end,
			-- }),
			use({
				"rmagatti/session-lens",
				after = "telescope.nvim",
				config = function()
					require("session-lens").setup({})
				end,
			}),

			use({
				"rcarriga/nvim-notify",
				after = "telescope.nvim",
				config = function()
					require("plugins.nvim-notify")
				end,
			}),
		})

		use({
			"numToStr/Navigator.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.navigator")
			end,
		})

		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("plugins.hop")
			end,
		})

		--		use {
		--			'karb94/neoscroll.nvim',
		--			event = 'WinScrolled',
		--			config = function()
		--				require('plugins.neoscroll')
		--			end
		--		}

		----- Editing to the MOON -----
		--[[ use({
			"b3nj5m1n/kommentary",
			event = "BufRead",
		}) ]]

		use({
			"numToStr/Comment.nvim",
			event = "BufRead",
			config = function()
				require("plugins.comment")
			end,
		})

		use({
			"tpope/vim-surround",
			event = "BufRead",
			requires = {
				{
					"tpope/vim-repeat",
					event = "BufRead",
				},
			},
		})

		use({
			"wellle/targets.vim",
			event = "BufRead",
		})

		use({
			"numToStr/Buffers.nvim",
			event = "BufRead",
			config = function()
				require("plugins.buffers")
			end,
		})

		use({
			"junegunn/vim-easy-align",
			event = "BufRead",
			setup = function()
				require("plugins.vim-easy-align")
			end,
		})

		----- Terminal -----
		use({
			"numToStr/FTerm.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.fterm")
			end,
		})

		----- Web -----
		use({
			"mattn/emmet-vim",
			event = "BufRead",
			setup = function()
				require("plugins.emmet")
			end,
		})

		use({
			"AndrewRadev/tagalong.vim",
			event = "BufRead",
			setup = function()
				require("plugins.tagalong")
			end,
		})

		----- LSP, Completions and Snippets -----
		use({
			{
				"williamboman/mason.nvim",
				-- bash-debug-adapter bash-language-server css-lsp emmet-ls eslint_d go-debug-adapter gofumpt golangci-lint gopls html-lsp json-lsp jsonlint lua-language-server prettierd pyright rust-analyzer rustfmt shellcheck shfmt stylua typescript-language-server vetur-vls yaml-language-server yamlfmt yamllint
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{
				"neovim/nvim-lspconfig",
				event = "BufRead",
				requires = {
					{ "hrsh7th/cmp-nvim-lsp" },
				},
				config = function()
					require("plugins.lsp.lspconfig")
				end,
			},
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("plugins.lsp.null-ls")
			end,
		})

		use({
			{
				"hrsh7th/nvim-cmp",
				-- event = "InsertEnter",
				config = function()
					require("plugins.lsp.nvim-cmp")
				end,
				requires = {
					{
						"L3MON4D3/LuaSnip",
						tag = "v<CurrentMajor>.*",
						-- event = "InsertEnter",
						config = function()
							require("plugins.lsp.luasnip")
						end,
						requires = {
							{
								"rafamadriz/friendly-snippets",
								event = "CursorHold",
							},
						},
					},
				},
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "ray-x/cmp-treesitter", after = "nvim-cmp" },
		})

		use({
			"windwp/nvim-autopairs",
			event = "InsertCharPre",
			after = "nvim-cmp",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		use({
			"andymass/vim-matchup",
			setup = function()
				-- may set any options here
				vim.g.matchup_matchparen_offscreen = { method = "popup" }
			end,
		})

		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})

		use({
			"rmagatti/auto-session",
			config = function()
				require("plugins.auto-session")
			end,
		})

		use({
			"winston0410/range-highlight.nvim",
			requires = { "winston0410/cmd-parser.nvim" },
			events = "BufWriteCmd",
			config = function()
				require("range-highlight").setup({})
			end,
		})

		-- use({
		-- 	"mg979/vim-visual-multi",
		-- 	events = "BufRead",
		-- })
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
