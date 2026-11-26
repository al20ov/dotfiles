-- From https://dotfiles.substack.com/p/native-lsp-in-neovim-012
--
-- I was worried about all these vim.lsp.enable() but apparently LSPs only
-- activate when needed (terraformls starts up when a tf or hcl file is opened)
--
-- For more details, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- Lua
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
vim.lsp.enable('lua_ls')

-- Terraform
vim.lsp.config('terraformls', {
    init_options = {
        indexing = {
            ignorePaths = { '.terraform' }
        }
    }
})
vim.lsp.enable('terraformls')

-- Go
vim.lsp.enable('gopls')
