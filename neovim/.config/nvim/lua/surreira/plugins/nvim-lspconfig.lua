return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>vrn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>vca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		end

		local servers = {
			astro = { filetypes = { "astro" } },
			cssls = { filetypes = { "html", "twig", "hbs", "blade" } },
			docker_compose_language_service = { filetypes = { "yaml" } },
			dockerls = {},
			emmet_ls = {
				filetypes = {
					"astro",
					"blade",
					"css",
					"html",
					"htmldjango",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			},
			eslint = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			},
			html = { filetypes = { "html", "twig", "hbs", "blade" } },
			jsonls = {
				filetypes = {
					"json",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			},
			lua_ls = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			pyright = { filetypes = { "python" } },
			tailwindcss = {},
			ts_ls = { filetypes = { "typescript", "typescriptreact" } },
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"black",
			"blade-formatter",
			"cspell",
			"flake8",
			"isort",
			"prettier",
			"stylua",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					})
				end,
			},
		})
	end,
}
