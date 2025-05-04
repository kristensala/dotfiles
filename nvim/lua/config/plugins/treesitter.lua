return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "tsx",
            "json",
            "css",
            "html",
            "lua",
            "javascript",
            "typescript",
            "odin"
        }
    },
}
