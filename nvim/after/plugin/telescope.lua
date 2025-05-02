local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                width = { padding = 10 },
                height = { padding = 5 },
                preview_width = 0,
            },
        },
    },
    extensions = {
    },
}

vim.keymap.set('n', '<leader>fi', function()
    builtin.find_files()
end)
vim.keymap.set('n', '<leader>gi', function()
    builtin.live_grep()
end)

