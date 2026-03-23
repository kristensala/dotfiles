vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Custom keymaps
    local opts = { buffer = ev.buf, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)                
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float({                               
        border = "single"                                                                                  
    }) end, opts)                                                                                          
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)                             
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)                             
    vim.keymap.set("n", "<leader>df", function() vim.diagnostic.setqflist() end, opts)                             
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)                     
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)                      
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)                          
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      -- vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})


vim.lsp.enable("ols")
vim.lsp.config["ols"] = {
    cmd = { "ols"},
    filetypes = { "odin" },
    root_markers = { "main.odin" },
    on_attach = on_attach
}

vim.lsp.enable("tsserver")
vim.lsp.config["tsserver"] = {
    cmd = { "typescript-language-server", "--stdio"},
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = vim.fs.root(0, { "package.json", ".git" }),
    on_attach = on_attach
}

vim.lsp.enable("html-lsp")
vim.lsp.config["html-lsp"] = {
    cmd = { "vscode-html-language-server", "--stdio"},
    filetypes = { "typescript", "typescriptreact", "typescript.tsx, html" },
    on_attach = on_attach
}



