local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint.with {
            only_local = "node_modules/.bin",
        },
        null_ls.builtins.code_actions.eslint.with {
            only_local = "node_modules/.bin",
        },
        null_ls.builtins.formatting.prettier.with {
            only_local = "node_modules/.bin",
        },
    },
    debug = true,
    on_attach = function (client, bufnr)
       if client.supports_method("textDocument/formatting") then
           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
           vim.api.nvim_create_autocmd("BufWritePre", {
               group = augroup,
               buffer = bufnr,
               callback = function ()
                   vim.lsp.buf.format({ bufnr = bufnr })
               end,
           })
        end
    end,
})
