require("nightfox").setup({
    terminal_colors = false,
    options = {
        styles = {
            comments = "italic",
            strings = "italic"

        }
    }
})

vim.cmd('colorscheme nightfox')
