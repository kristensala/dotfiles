local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "<CR>"]], opts)
keyset("i", "<TAB>", [[coc#pum#visible() ? coc#pum#next(1) : "<TAB>"]], opts)
keyset("n", "<leader>asd", "<cmd>Telescope find_files<cr>", {silent = true})
