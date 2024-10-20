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
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
			callback = function(event)
				local nmap = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local builtin = require("telescope.builtin")

				-- Rename the variable under the cursor
				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				-- Jump to the definition of the word under your cursor. (similar to vim.lsp.buf.definition)
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				nmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")

				-- Find references for the word under your cursor
				nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")

				-- Jump to the type of the word under your cursor. (similar to vim.lsp.buf.type_definition)
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
			jsonls = { filetypes = { "json" } },
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
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

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
