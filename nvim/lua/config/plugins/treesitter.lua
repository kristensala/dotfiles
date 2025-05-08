return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = {
            enable = true,
            disable = {}
        },
        event = { 'BufReadPost', 'BufNewFile' },
        ensure_installed = {
            "tsx",
            "json",
            "css",
            "html",
            "lua",
            "javascript",
            "typescript",
            "odin"
        },
        auto_install = true,
    },
    config = function()
        -- Add fallback to force indent enable for TSX
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "typescriptreact" },
            callback = function()
                vim.cmd("TSBufEnable indent")
            end,
        })
    end
}
