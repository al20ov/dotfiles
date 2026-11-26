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
    -- lspconfig
    'https://github.com/neovim/nvim-lspconfig',

    -- indentation lines
    'https://github.com/lukas-reineke/indent-blankline.nvim',

    -- auto bracket pairs
    'https://github.com/nvim-mini/mini.pairs',

    -- lualine
    'https://github.com/nvim-lualine/lualine.nvim',

    -- color scheme
    'https://github.com/sainnhe/sonokai',

    -- completion
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = 'v1.10.2'
    },

    -- telescope
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})

require('ibl').setup()
require('mini.pairs').setup()

-- LSP stuff
-- points to lua/lsp-config.lua
require('lsp-config')
-- END LSP stuff

-- color scheme config
vim.g.sonokai_style = 'maia'
vim.cmd.colorscheme('sonokai')
-- END color scheme config

-- lualine config
require('lualine').setup({
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
})
vim.o.showmode = false
vim.o.cmdheight = 0
-- END lualine config

-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<Leader>fg', builtin.find_files, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
-- END telescope keybinds

-- completion config
require('blink.cmp').setup({
    keymap = { preset = 'super-tab' },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    fuzzy = {
        implementation = 'rust'
    },
    signature = { enabled = true }
})
-- END completion config

vim.diagnostic.config({
    update_in_insert = false
})
