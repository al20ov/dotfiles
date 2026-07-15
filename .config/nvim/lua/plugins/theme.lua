local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    {
        -- "vimcolorschemes/olive-crt.nvim",
        "ogswag/valve-olive.nvim",
        config = function()
            vim.cmd.colorscheme "valve-olive"
            -- enable_transparency()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            }
        },
    }
}
