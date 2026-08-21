vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars:append('trail:⋅')
vim.opt.listchars:append('space:⋅')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoread = true

vim.opt.signcolumn = 'yes'

vim.opt.scrolloff = 8

-- set leader key to space
vim.g.mapleader = ' '

vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/sainnhe/sonokai',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = 'v1.10.2'
    },
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})

require('oil').setup()
require('ibl').setup()
require('mini.pairs').setup()

-- LSP config
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
    ensure_installed = {
        'lua_ls',
        'stylua',
    }
})

vim.lsp.config('terraformls', {
    init_options = {
        indexing = {
            ignorePaths = { '.terraform' }
        }
    }
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require',
                }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true)
            },
            telemetry = {
                enable = false
            }
        }
    }
})
-- END LSP config

-- autocomplete config
require('blink.cmp').setup({
    keymap = { preset = 'super-tab' },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    fuzzy = {
        implementation = "rust"
    },
    signature = { enabled = false }
})
-- END autocomplete config

-- lualine config
require('lualine').setup({
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
})
vim.o.showmode = false -- hide mode status in bottom bar
-- END lualine config

vim.cmd.colorscheme('sonokai')

-- telescope keybinds (leader here is the spacebar)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
-- END telescope keybinds

vim.diagnostic.config({
    update_in_insert = false
})
