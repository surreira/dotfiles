local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap(
    "<leader>F",
    function() require('conform').format { async = true, lsp_fallback = true } end,
    "[F] format current buffer"
  )
  nmap("<leader>vrn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>vca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

local servers = {
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs', 'blade' } },
  pyright = { filetypes = { 'python' } },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  tailwindcss = {},
  eslint = {},
  astro = { filetypes = { 'astro' } },
  emmet_ls = {
    filetypes = {
      'astro',
      'blade',
      'html',
      'htmldjango',
      'javascriptreact',
      'typescriptreact',
    },
  },
}

-- Setup neovim lua configuration
require('lazydev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}
