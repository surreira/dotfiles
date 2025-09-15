return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local nmap = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")

				nmap("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
				nmap("gI", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")

				nmap("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinition")
				nmap("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("fzf-lua").lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")

				nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
			end,
		})

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

		local servers = {
			astro = {},
			bashls = {},
			cssls = {},
			docker_compose_language_service = {},
			dockerls = {},
			gopls = {},
			html = {},
			jsonls = {},
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
			phpactor = {},
			psalm = {},
			pyright = {},
			tailwindcss = {},
			ts_ls = {},
		}

		require("mason").setup({
			ui = {
				backdrop = 100,
			},
		})

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"black",
			"blade-formatter",
			"djlint",
			"eslint_d",
			"flake8",
			"isort",
			"shfmt",
			"shellcheck",
			"stylua",
			"php-cs-fixer",
			"prettier",
			"prettierd",
			"vale",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			automatic_enable = true,
			ensure_installed = {},
			automatic_installation = false,
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
