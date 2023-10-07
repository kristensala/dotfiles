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
  },
  extensions = {
  },
}

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files()
end)
vim.keymap.set('n', '<leader>g', function()
  builtin.live_grep()
end)

