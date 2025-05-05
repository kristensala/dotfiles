return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- LSP Support
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
    },
    config = function()
        vim.opt.signcolumn = 'yes'
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = {buffer = event.buf, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gf", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover({
                    border = "single"
                }) end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float({
                    border = "single"
                }) end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end
        })


        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html",
                "ols",
                "ts_ls",
                "gopls",
                "cssls"
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })
    end
}
