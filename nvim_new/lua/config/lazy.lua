-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { 
        "ThePrimeagen/harpoon", branch = "harpoon2", 
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
        end
    },
    { 
        "nvim-telescope/telescope.nvim", version = "*",
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fi', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>gi', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end

    },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "mason-org/mason.nvim", opts = {} },
    { 
        "nvim-treesitter/nvim-treesitter", lazy = false,
        build = ":TSUpdate",
        opts = {
            highlight = {
                enabled = false
            },
            indent = {
                enabled = true
            }
        },
        config = function()
            -- @Fix tsx file html indentation
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "typescriptreact" },
                callback = function()
                    vim.cmd(":TSBufEnable indent")
                end

            })

        end
    },
    {
        'saghen/blink.cmp',
        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false
                    },
                },
                documentation = { auto_show = true },
                accept = {
                    auto_brackets = {
                        enabled = false,
                    }
                },
                menu = {
                    draw = {
                        columns = { 
                            { "label", "label_description", "source_name", gap = 1 }
                        },
                    }
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
