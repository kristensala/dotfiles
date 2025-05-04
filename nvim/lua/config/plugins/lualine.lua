return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = function()
        return {
            options = {
                icons_enabled = false
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch"},
                lualine_c = {"filename"},
                lualine_x = {"diagnostics", "encoding", "fileformat"},
                lualine_y = {},
                lualine_z = {"location"}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
