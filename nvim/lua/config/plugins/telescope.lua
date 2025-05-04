return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require('telescope.actions')
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>fi", function()
            builtin.find_files()
        end)
        vim.keymap.set("n", "<leader>gi", function()
            builtin.live_grep()
        end)

    end
}
